class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    authorize @comment
    @post.comments << @comment
    current_user.comments << @comment
    if @comment.save
      flash[:notice] = "Comment successfully added."
      redirect_to post_path(@post)
    else
      flash[:alert] = "Unable to add comment, try again."
      redirect_to :back
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    flash[:notice] = "Comment successfully updated."
    redirect_to post_path(@comment.post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    comment = Comment.find(params[:id])
    authorize comment
    flash[:notice] = "Comment successfully deleted."
    comment.destroy
    redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
