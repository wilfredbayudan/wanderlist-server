class Tag < ActiveRecord::Base
  has_many :bucketlist_tags
  has_many :bucketlists, through: :bucketlist_tags
end