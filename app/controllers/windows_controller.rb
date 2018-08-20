class WindowsController < ApplicationController
  before_action :validate_user_info
  skip_before_action :validate_user_info, only: [:show]

  def show
    @site = Site.find(params[:site_id])
    @window = Window.find(params[:id])
  end

  def index
    @windows = Window.all
  end

  def new
    @site = Site.find(params[:site_id])
    @window = @site.windows.build
  end

  def edit
    @site = Site.find(params[:site_id])
    @window = Window.find(params[:id])
  end

  def create
    #@user = current_user
    @site = Site.find(params[:site_id])
    @window = Window.create(window_params)
    #raise params.inspect
    if @window.valid?
      @window.save
      @site.windows << @window
      redirect_to site_window_path(@site, @window)
    else
      flash[:message] = "Please ensure that at the very least, your window has a name."
      render :new
    end
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
