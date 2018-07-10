class UserCommentsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy]

  def new
    @site = Site.find(params[:site_id])
    @user_comments = UserComment.new
  end

  def create
    #@user = current_user
    @site = Site.find(params[:site_id])
    @user_comment = UserComment.create(user_comment_params)
    if @user_comment.valid?
      @user_comment.save
      @site.user_comments << @user_comment
      redirect_to site_path(@site)
    #else
    #@site = Site.find_by(params[:site_id])
    #@user_comment = UserComment.new(user_comment_params)
    #if @user_comment.valid?
    #  @user_comment.save
    #  redirect_to site_path(@site)
    else
      flash[:message] = "Please enter a comment."
      redirect_to new_site_user_comment_path
    end
  end

  def edit
    @user_comment = UserComment.find(params[:id])
  end

  def update
    @user_comment = UserComment.find(params[:id])
    @user_comment.update(user_comment_params)
    if @user_comment.save
      redirect_to site_path(@site)
    else
      render :edit
    end
  end

  def destroy
    @user_comment = UserComment.find(params[:id])
    @user_comment.destroy
    redirect_to user_path(current_user)
  end

  private

  def user_comment_params
    params.require(:user_comment).permit(
      :comment_text
    )
  end

end
