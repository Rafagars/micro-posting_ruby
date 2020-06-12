module ApplicationHelper
  def post_already_liked(id)
    Like.where(user_id: current_user.id, post_id: id).exists?
  end

  def comment_already_liked(id)
    Heart.where(user_id: current_user.id, comment_id: id).exists?
  end
end
