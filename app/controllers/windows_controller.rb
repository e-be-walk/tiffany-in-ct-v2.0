class WindowsController < ApplicationController

  def show
    #@site = Site.find(params[:id])
    #@user = current_user
    @site = Site.find(params[:site_id])
    @window = Window.find(params[:id])
  end

  def new
    @site = Site.find(params[:site_id])
    @window = @site.windows.build
    #@window = Window.new
  end

  def edit
    @site = Site.find(params[:site_id])
    @window = Window.find(params[:id])
  end

  def create
    @user = current_user
    @site = Site.find(params[:site_id])
    @window = Window.create(window_params)
    @window.save
    @site.windows << @window
    #raise params.inspect
    redirect_to site_window_path(@site, @window)
  end

  def update
    @site = Site.find(params[:site_id])
    @window = Window.find(params[:id])
    @window.update(window_params)
    @window.save
    redirect_to site_window_path(@site, @window)
  end

  def destroy
    @window = Window.find(params[:id])
    @window.destroy
    redirect_to user_path(current_user)
  end


  private

  def window_params
    params.require(:window).permit(
      :user_id,
      :site_id,
      :name,
      :year_created,
      :dedication,
      :window_info,
      :image
    )
  end
end
