class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :clear_flash

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    authorize @comment
    @post.comments << @comment
    current_user.comments << @comment
    if @comment.save
      flash[:notice] = "Comment successfully added."
      respond_to do |format|
        format.html { redirect_to post_path(@post) }
        format.js
      end
    else
      flash[:alert] = "Unable to add comment, try again."
      respond_to do |format|
        format.html { redirect_to :back }
        format.js { render :error }
      end
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

  def clear_flash
    flash[:notice] = nil
    flash[:alert]  = nil
  end
end
