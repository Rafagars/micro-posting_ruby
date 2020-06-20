class UsersController < ApplicationController
  def show
    @user = User.find_by_name(params[:id])
    @posts = @user.posts.paginate(page: params[:page], per_page: 5)
  end
end
