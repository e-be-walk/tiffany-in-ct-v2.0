class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end

  def create
    if @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        #@user = current_user
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to new_user_url
      end
    else
      @user = User.new
      flash[:message] = "That doesn't match our records. Would you like to create a new account?"
      redirect_to new_user_url
    end
  end

  def facebook
    if auth
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.password = params[:code][0..71]
      end
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @user = User.new
      redirect_to new_user_url
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
