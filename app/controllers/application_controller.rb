class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get "/" do
    "Wanderlist API"
  end

end
