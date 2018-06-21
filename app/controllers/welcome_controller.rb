class WelcomeController < ApplicationController

  def about
  end

  def index
    @sites = Site.all
    @windows = Window.all
    #@site = Site.find_by(params[:site_id])
    @window = Window.find_by(params[:id])
  end
end
