class PostsController < ApplicationController
  def index
    @latest_post = Post.newest
    @recent_posts = Post.most_recent(5)
  end

  def new
    @post = Post.new
    authorize @post, :create?
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
      redirect_to :back
    end
  end

  def destroy
    post = Post.find(params[:id])
    authorize post
    flash[:notice] = "Post successfully deleted."
    post.destroy
    redirect_to posts_path
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    @post.update(post_params)
    flash[:notice] = "Post successfully updated."
    redirect_to post_path(@post)
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
