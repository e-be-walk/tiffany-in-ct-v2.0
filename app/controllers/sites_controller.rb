class SitesController < ApplicationController
  before_action :current_user
  before_action :validate_user_info
  before_action :set_site, only: [:show, :edit, :update, :destroy, :next]
  skip_before_action :validate_user_info, only: [:show]
  skip_before_action :current_user, only: [:show]

  def show
    #@site = Site.find(params[:id])
    respond_to do |f|
      f.html
      f.json {render json: @site}
    end
  end

  def api_show
    render json: @site
  end

  def next
    @next_site = @site.next
    render json: @next_site
    #respond_to do |f|
    #  f.html
    #  f.json {render json: @next_site}
    #end
  end

  def new
    @site = Site.new
  end

  def index
    @sites = Site.all
    respond_to do |f|
      f.html
      f.json {render json: @sites}
    end
  end

  def create
    #@user = current_user
    @site = Site.create(site_params)
    if @site.valid?
      @site.save
      redirect_to site_path(@site)
    else
      flash[:message] = "Please ensure that at the very least, your site has a name."
      redirect_to new_site_path
    end
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    @site.update(site_params)
    if @site.save
      redirect_to site_path(@site)
    else
      render :edit
    end
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to user_path(current_user)
  end

  def recent
    @sites = Site.recent
    render action: :index
  end

  def active
    @sites = Site.active
    render action: :index
  end


  private

  def set_site
    @site = Site.find_by_id(params[:id])
  end

  def site_params
    params.require(:site).permit(
      :user_id,
      :name,
      :street_address,
      :city,
      :zip_code,
      :contact_info,
      :accessibility,
      :site_info,
      :image,
      :site_windows_count
    )
  end
end
