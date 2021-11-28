class PostsController < ApplicationController
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
  end

  def index
    @user = current_user
    @posts = Post.all.order(id: "DESC")
    @post = Post.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:brand, :introduction, :country, :post_image)
  end
end
