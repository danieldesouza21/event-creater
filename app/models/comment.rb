# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  body         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  commenter_id :integer
#  photo_id     :integer
#
class Comment < ApplicationRecord

  def commenter
    my_id = self.id

    matching_comments = Comment.where({ :commenter_id => my_id })

    return matching_comments
  end

end
