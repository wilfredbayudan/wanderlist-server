class BucketlistTag < ActiveRecord::Base
  belongs_to :bucketlist
  belongs_to :tag
end