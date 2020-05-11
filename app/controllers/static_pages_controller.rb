class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to posts_index_path
    end
  end
end
