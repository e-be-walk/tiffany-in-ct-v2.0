class WelcomeController < ApplicationController

  def about
  end

  def index
    @sites = Site.all
    @windows = Window.all
  end
end
