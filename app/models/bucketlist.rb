require_relative '../modules/like'

class Bucketlist < ActiveRecord::Base

  include Like::InstanceMethods

  has_many :bucketlist_tags
  has_many :tags, through: :bucketlist_tags
  has_many :bucketlist_destinations
  has_many :destinations, through: :bucketlist_destinations
  has_many :comments

  def add_destination(lat:, lng:, label:)
    destination = Destination.find_or_create_by(
      lng: lng,
      lat: lat
    )
    destination.label = label
    destination.save
    self.destinations << destination
    self.bucketlist_destinations.last
  end

end