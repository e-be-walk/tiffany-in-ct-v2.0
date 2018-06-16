class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if auth
      user = User.find_by(email: user_params[:email])
      current_user(user)
      redirect_to user_path
    else
      user = User.find_by(email: user_params[:email])
      if user && user.authenticate(user_params[:password])
        current_user(user)
        redirect_to user_path
      else
        flash[:message] = "Incorrect Login Information."
        redirect_to login_path
      end
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
