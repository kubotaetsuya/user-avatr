class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
  user=User.create!(user_params)
  redirect_to root_path
  end

  def update
    if@user.update(user_params)&&@user.avatar.attach(params[:avatar])
      redirect_touser_path(@user)
    else
      render:edit
    end
  end

  private
  defuser_params
    params.require(:user).permit(:name,:avatar)
  end
end
