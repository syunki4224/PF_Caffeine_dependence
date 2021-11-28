class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      @posts =Post.all
      @user = current_user
      render 'index'
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @user = User.find(@post.user_id)
  end

  def index
    @user = current_user
    @posts = Post.all.order(id: "DESC")
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])

  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:brand, :introduction, :country, :post_image)
  end
end
