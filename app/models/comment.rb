class Comment < ActiveRecord::Base
  belongs_to :bucketlist
  belongs_to :location
end