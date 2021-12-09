class BucketlistDestination < ActiveRecord::Base
  belongs_to :bucketlist
  belongs_to :destination
end