class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @user = current_user
    @site = Site.find(site_params[:id])
    @comment = Comment.create(comment_params)
    @comment.save
    current_user.comments << @comment
    redirect_to site_path(@site)
  end

  private

  def comment_params
    params.require(:comment).permit(
      :comment_text,
      :user_id,
      :site_id
    )
  end
end
