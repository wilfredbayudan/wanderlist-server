class Bucketlist < ActiveRecord::Base
  has_many :bucketlist_tags
  has_many :tags, through: :bucketlist_tags
  has_many :bucketlist_destinations
  has_many :destinations, through: :bucketlist_destinations
  has_many :comments

end