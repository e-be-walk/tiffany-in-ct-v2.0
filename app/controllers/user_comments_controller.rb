class UserCommentsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy]

  def new
    @user_comments = UserComment.new
  end

end
