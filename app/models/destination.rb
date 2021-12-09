class Destination < ActiveRecord::Base
  has_many :comments
  has_many :bucketlist_destinations
  has_many :bucketlists, through: :bucketlist_destinations
end