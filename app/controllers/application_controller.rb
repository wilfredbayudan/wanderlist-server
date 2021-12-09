class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/bucketlists" do
    bucketlists = Bucketlist.all
    bucketlists.to_json(only: [:id, :name, :description, :created_by, :likes, :updated_at, :created_at], :include => {
      :bucketlist_destinations => {only: [:notes, :id], :include => :destination},
      :tags => {},
    })
  end

  get "/bucketlists/findby/:attr/:query" do
    bucketlist = Bucketlist.where("LOWER(#{params[:attr]}) = ?", params[:query].downcase)
    bucketlist.to_json(only: [:id, :name, :description, :created_by, :likes, :updated_at, :created_at])
  end

  get "/bucketlists/:id" do
    bucketlist = Bucketlist.find(params[:id])
    # bucketlist.to_json(only: [:id, :name, :description, :created_by, :likes, :updated_at, :created_at], :include => [
    #   :tags,
    #   :bucketlist_destinations,
    #   :comments
    # ])
    bucketlist.to_json(only: [:id, :name, :description, :created_by, :likes, :updated_at, :created_at], :include => {
      :bucketlist_destinations => {only: [:notes, :id], :include => :destination},
      :tags => {},
      :comments => {}
    })
  end
  
  delete "/bucketlists/:id" do
    pin = request.env['HTTP_PIN']
    bucketlist = Bucketlist.find(params[:id])
    if pin == bucketlist.pin
      bucketlist.destroy
      res = bucketlist
    else
      res = {"error" => "Could not delete, invalid PIN"}
    end
    res.to_json
  end

  post "/bucketlists" do
    bucketlist = Bucketlist.create(
      name: params[:name],
      description: params[:description],
      created_by: params[:created_by],
      pin: params[:pin]
    )
    bucketlist.to_json(only: [:id, :name, :description, :created_by, :likes, :updated_at, :created_at, :pin], :include => {
      :bucketlist_destinations => {only: [:notes, :id], :include => :destination},
      :tags => {},
    })
  end

  get "/bucketlists/:id/auth" do
    bucketlist = Bucketlist.find(params[:id])

    res = { "permission" => bucketlist.pin == request.env['HTTP_PIN'] }
    res.to_json
  end

  get "/destinations" do
    destinations = Destination.all
    destinations.to_json(:include => {
      :bucketlists => { only: [:id, :name, :description, :created_by, :likes, :updated_at, :created_at], :include => {
        :bucketlist_destinations => {only: [:notes, :id], :include => :destination},
        :tags => {},
      }}
    })
  end

  get "/destinations/:id" do
    destination = Destination.find(params[:id])
    destination.to_json
  end

  post "/bucketlists/:id/destinations" do
    bucketlist = Bucketlist.find(params[:id])
    if request.env['HTTP_PIN'] == bucketlist.pin
      destination = Destination.find_or_create_by(
        lng: params[:lng],
        lat: params[:lat]
      )
      destination.label = params[:label]
      destination.save
      bucketlist.destinations << destination
      res = bucketlist.bucketlist_destinations.last.to_json(only: [:notes, :id], :include => :destination)
    else
      res.to_json = {"error" => "Could not add destination, invalid PIN"}
    end
      res
  end

  delete "/bucketlists/:id/destinations/:bucketlist_destination_id" do
    bucketlist = Bucketlist.find(params[:id])
    if request.env['HTTP_PIN'] == bucketlist.pin 
      bucketlist_destination = BucketlistDestination.find(params[:bucketlist_destination_id])
      bucketlist_destination.destroy
      res = bucketlist_destination
    else 
      res = {"error" => "Could not remove destination, invalid PIN"}
    end
      res.to_json
  end

  get "/destinations/:id" do
    destination = Destination.find(params[:id])
    destination.to_json(:include => [
      :comments,
      :bucketlists
    ])
  end

end
