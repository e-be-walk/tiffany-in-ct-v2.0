class SitesController < ApplicationController
  before_action :validate_user_info
  skip_before_action :validate_user_info, only: [:show]

  def show
    @user = current_user
    @site = Site.find(params[:id])
    #@comments = Comment.find_by(site_id: params[:site_id])
  end

  def new
    @site = Site.new
  end

  def index
    #@sites = Site.text_search(params[:query]).page(params[:page]).per_page(3)
    if params[:search]
      @sites = Site.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}"])
    else
      @sites = Site.all
    end
  end

  def create
    #@user = current_user
    @site = Site.create(site_params)
    @site.save
    #current_user.sites << @site
    redirect_to site_path(@site)
  end

  def edit
    @site = Site.find_by(params[:id])
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


  private

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
      :image
    )
  end
end
