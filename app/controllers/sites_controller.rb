class SitesController < ApplicationController

  def show
    @site = Site.find_by(id: params[:id])
    @user = current_user
    @comments = Comment.find_by(site_id: params[:site_id])
  end

  def new
    @site = Site.new
  end

  def create
    @user = current_user
    @site = Site.create(site_params)
    @site.save
    current_user.sites << @site
    redirect_to new_user_site_path(@site)
  end

  def edit
  end

  def update
    @site = Site.find(params[:id])
    @site.update(site_params)
    if @site.save
      redirect_to user_site_path(@site)
    else
      render :edit
    end
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
