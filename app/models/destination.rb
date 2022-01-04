require_relative '../modules/likes'

class Destination < ActiveRecord::Base

  include Likes::InstanceMethods

  has_many :comments
  has_many :bucketlist_destinations
  has_many :bucketlists, through: :bucketlist_destinations

end