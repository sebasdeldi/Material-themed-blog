class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    redirect_to root_path
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @post = current_user.posts.build(post_params)
    if @post.update
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def post_params
      params.require(:post).permit(:name, :body, :image_url)
    end
end
