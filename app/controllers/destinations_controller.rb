class DestinationsController < Sinatra::Base

  set :default_content_type, 'application/json'

  get "/destinations" do
    destinations = Destination.all
    destinations.to_json(:include => {
      :bucketlists => { only: [:id, :name, :created_by]}
    })
  end

  get "/destinations/:id" do
    destination = Destination.find(params[:id])
    destination.to_json(:include => {
      :bucketlists => { only: [:id, :name, :created_by]}
    })
  end

  patch "/destinations/:id" do
    destination = Destination.find(params[:id])
    case params[:method]
    when 'like'
      res = destination.like
    when 'dislike'
      res = destination.dislike
    end
    res.to_json;
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