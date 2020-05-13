class LikesController < ApplicationController
  before_action :find_post

  include ApplicationHelper

  def create
    if already_liked?
      @like = Like.find_by(params[:user_id])
      @like.destroy
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to request.referrer
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
