class BucketlistsController < Sinatra::Base

  set :default_content_type, 'application/json'

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
    bucketlist.to_json(only: [:id, :name, :description, :created_by, :likes, :updated_at, :created_at], :include => {
      :bucketlist_destinations => {only: [:notes, :id], :include => :destination},
      :tags => {},
      :comments => {}
    })
  end

  patch "/bucketlists/:id" do
    bucketlist = Bucketlist.find(params[:id])
    case params[:method]
    when 'like'
      res = bucketlist.like
    when 'dislike'
      res = bucketlist.dislike
    when 'updateDetails'
      if request.env['HTTP_PIN'] == bucketlist.pin
        bucketlist.description = params[:description]
        bucketlist.save
        res = bucketlist
      else
        res = {"error" => "Could not update, invalid PIN"}
      end
    end
    res.to_json;
  end

  delete "/bucketlists/:id" do
    bucketlist = Bucketlist.find(params[:id])
    if request.env['HTTP_PIN'] == bucketlist.pin
      bucketlist.bucketlist_destinations.destroy_all
      bucketlist.destroy
      res = bucketlist
    else
      res = {"error" => "Could not delete, invalid PIN"}
    end
    res.to_json
  end

  delete "/bucketlists/:id/comments/:comment_id" do
    comment = Comment.find(params[:comment_id])
    comment.destroy
    comment.to_json
  end

  post "/bucketlists/:id/comments" do
    bucketlist = Bucketlist.find(params[:id])
    comment = Comment.create(
      created_by: params[:created_by],
      comment: params[:comment]
    )
    bucketlist.comments << comment
    comment.to_json
  end

  patch "/bucketlists/:id/destinations/:bucketlist_destination_id" do
    bucketlist = Bucketlist.find(params[:id])
    if request.env['HTTP_PIN'] == bucketlist.pin
      bucketlist_destination = BucketlistDestination.find(params[:bucketlist_destination_id])
      bucketlist_destination.notes = params[:notes]
      bucketlist_destination.save
      res = bucketlist_destination
    else
      res = {"error" => "Could not update destination, invalid PIN"}
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

end