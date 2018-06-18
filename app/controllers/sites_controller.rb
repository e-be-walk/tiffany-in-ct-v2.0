class SitesController < ApplicationController

  def show
    @user = current_user
    @site = Site.find(params[:id])
    #@comments = Comment.find_by(site_id: params[:site_id])
  end

  def new
    @site = Site.new
  end

  def create
    #@user = current_user
    @site = Site.create(site_params)
    @site.save
    #current_user.sites << @site
    redirect_to site_path(@site)
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
