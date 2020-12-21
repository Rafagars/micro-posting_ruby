class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_path(@post)
    elsif @comment.body
      flash[:warning] = t"comment.flash.warning"
      redirect_to post_path(@post)
    else
      flash[:danger] = "Error with the comment. Please try again or report the error"
      redirect_to post_path(@post)
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if current_user.id != @comment.user_id
      flash[:warning] = t"comment.flash.warning"
    elsif @comment.update(comment_params)
      flash[:success] = t"comment.flash.updated"
    else
      flash[:warning] = t"comment.flash.blank"
    end
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      flash[:success] = t"comment.flash.deleted"
      redirect_to @post
    else
      flash[:danger] = "Comment cannot be deleted. Sorry :("
      redirect_to @post
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
