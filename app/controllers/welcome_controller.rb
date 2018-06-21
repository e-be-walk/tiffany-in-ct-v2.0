class WelcomeController < ApplicationController

  def about
  end

  def index
    @sites = Site.all
    @windows = Window.all
    @window = Window.find_by(params[:id])
  end
end
