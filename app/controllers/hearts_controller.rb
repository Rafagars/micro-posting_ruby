class HeartsController < ApplicationController
  before_action :find_comment

  include ApplicationHelper

  def create
    if already_hearted?
      @heart = Heart.find_by(params[:user_id])
      @comment.update(liked: 'far fa-heart')
      @heart.destroy
    else
      @comment.hearts.create(user_id: current_user.id)
      @comment.update(liked: 'fas fa-heart')
    end
    redirect_to post_path(@post)
  end

  private

  def find_comment
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:comment_id])
  end
end
