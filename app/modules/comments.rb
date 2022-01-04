module Comments

  module InstanceMethods

    def add_comment (created_by:, comment:)
      comment = Comment.create(
        created_by: created_by,
        comment: comment
      )
      self.comments << comment
      comment
    end

  end

end