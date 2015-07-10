class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @post.comments << @comment
    current_user.comments << @comment
    if @comment.save
      redirect_to post_path(@post)
    else
      redirect_to :back
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
