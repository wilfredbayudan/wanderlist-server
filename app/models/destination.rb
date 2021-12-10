class Destination < ActiveRecord::Base
  has_many :comments
  has_many :bucketlist_destinations
  has_many :bucketlists, through: :bucketlist_destinations

  def like
    self.likes += 1;
    self.save
    self.likes
  end

  def dislike
    if self.likes > 0
      self.likes -= 1;
      self.save
    end
    self.likes
  end

end