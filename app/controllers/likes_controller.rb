class LikesController < ApplicationController
  before_action :find_post

  include ApplicationHelper

  def create
    if post_already_liked(@post.id)
      @like = Like.find_by(user_id: current_user.id, post_id: @post.id)
      @like.destroy
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
