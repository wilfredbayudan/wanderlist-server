require_relative '../modules/like'

class Destination < ActiveRecord::Base

  include Like::InstanceMethods

  has_many :comments
  has_many :bucketlist_destinations
  has_many :bucketlists, through: :bucketlist_destinations

end