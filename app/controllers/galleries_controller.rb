class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
    render :json => @galleries
  end

  def show
    @gallery = Gallery.find(params[:id])
    if @gallery
      render :json => @gallery
    else 
      error_message
    end 
  end 

  def create
    @gallery.new(gallery_params)
    if @gallery.save
      render :json => @gallery
    else 
      error_message
    end 
  end

  private

  def gallery_params
    params.require(:gallery).permit(:id, :name, :max_paintings, :email, :phone_number, :address [:street_address, :city, :state, :zip])
  end 
end
