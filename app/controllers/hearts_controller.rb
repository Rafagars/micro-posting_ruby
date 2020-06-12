class HeartsController < ApplicationController
  before_action :find_comment

  include ApplicationHelper

  def create
    if comment_already_liked(@comment.id)
      @heart = Heart.find_by(params[:user_id])
      @heart.destroy
    else
      @comment.hearts.create(user_id: current_user.id)
    end
    redirect_to post_path(@post)
  end

  private

  def find_comment
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:comment_id])
  end
end
