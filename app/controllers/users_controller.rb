class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_url
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :password,
      :site_admin,
      :email
    )
  end
end
