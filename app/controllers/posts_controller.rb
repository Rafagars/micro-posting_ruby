class PostsController < ApplicationController

  include ApplicationHelper
  before_action :authenticate_user!

  def index
    if !user_signed_in?
      redirect_to root_path
    end
    @posts = Post.paginate(page: params[:page])
    @most_liked = Post.order(:likes).first
    @most_commented = Post.order(:comments).first
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to posts_path
    else
      render 'posts/index'
    end

  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.paginate(page: params[:page])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    flash[:success] = "Post updated"

    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.comments.destroy_all
    if @post.destroy
      flash[:success] = "Post deleted"
      redirect_to posts_path
    else
      flash[:danger] = "Error deleting the post"
      redirect_to @post
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, uploads: [])
  end
end
