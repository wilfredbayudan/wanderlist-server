module Like
  module InstanceMethods

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

end