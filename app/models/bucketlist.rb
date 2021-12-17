class Bucketlist < ActiveRecord::Base
  has_many :bucketlist_tags
  has_many :tags, through: :bucketlist_tags
  has_many :bucketlist_destinations
  has_many :destinations, through: :bucketlist_destinations
  has_many :comments

  def self.verify_pin(id:, pin:)
    bucketlist = Bucketlist.find(id)
    if pin == bucketlist.pin
      true
    else
      false
    end
  end

end