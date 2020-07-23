class PublicController < ApplicationController
  def index
    @posts = Post.all.limit(3)
  end

  def profile
    @profile = User.find_by_username params[:username]
    @comments = @profile.comments
  end

  def about
  end

  def contact
  end
end
