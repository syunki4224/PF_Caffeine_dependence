class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts.order(id: "DESC")
  end

  def index
    @user = User.find(current_user.id)
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    if
      @user = current_user
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render "edit"
    end
  end

  def destroy
  end

  def followings
  end

  def followers
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
