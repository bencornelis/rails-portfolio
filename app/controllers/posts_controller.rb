class PostsController < ApplicationController
  def index
    @latest_post = Post.newest
    @recent_posts = Post.most_recent(5)
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def show
    @post = Post.find(params[:id])
    @recent_posts = Post.most_recent(5)
  end

  def create
    @post = Post.new(post_params)
    authorize @post
    if @post.save
      flash[:notice] = "Post successfully added."
      redirect_to posts_path
    else
      flash[:alert] = "Unable to add post, try again."
      render :new
    end
  end

  def destroy
    flash[:notice] = "Post successfully deleted."
    post = Post.find(params[:id])
    authorize post
    post.destroy
    redirect_to posts_path
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update(post_params)
      flash[:notice] = "Post successfully updated."
      redirect_to post_path(@post)
    else
      flash[:alert] = "Unable to update post, try again."
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
