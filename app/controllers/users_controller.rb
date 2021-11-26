class UsersController < ApplicationController
  def show
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def followings
  end

  def followers
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
