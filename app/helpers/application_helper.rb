module ApplicationHelper
  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end

  def already_hearted?
    Heart.where(user_id: current_user.id, comment_id: params[:comment_id]).exists?
  end
end
