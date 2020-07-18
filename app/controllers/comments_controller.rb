class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @comments = Comment.all
  end

  def new 
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end
  
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new comment_params
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to post_path(@post)
    else
      @post = Post.find(params[:post_id])
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
