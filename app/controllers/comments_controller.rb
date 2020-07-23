class CommentsController < ApplicationController
  before_action :set_post, only: [:new, :create, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @comments = Comment.all
  end

  def new 
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new comment_params
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to post_path(@post)
    else
      set_post
      render :new
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def set_post
		@post = Post.find(params[:post_id])
	end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
