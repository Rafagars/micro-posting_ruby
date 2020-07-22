class PostsController < ApplicationController

  include ApplicationHelper
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :set_post, only: [:edit, :update, :show, :destroy]

  def index
    @posts = @q.result.paginate(page: params[:page], per_page: 5).with_rich_text_content_and_embeds
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to posts_path
    elsif @post.title
      flash.now[:warning] = "Title can't be blank"
      render action: 'new'
    else
      render 'posts/index'
    end

  end

  def show
    @comments = @post.comments.paginate(page: params[:page], per_page: 5)
  end

  def edit
    if current_user.id != @post.user_id 
      flash[:warning] = "You aren't the post user"
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    if current_user.id != @post.user_id 
      flash[:warning] = "You aren't the post user"
      redirect_to root_path
    elsif @post.update(post_params)
      flash[:success] = "Post updated"
      redirect_to post_path
    elsif @post.title
      flash.now[:warning] = "Title can't be blank"
      render action: 'edit'
    end
 
  end

  def destroy
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

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
