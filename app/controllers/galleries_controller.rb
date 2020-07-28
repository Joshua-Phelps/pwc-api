class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
    render :json => @galleries
  end

  def show
    @gallery = Gallery.find(params[:id])
    render :json => @gallery
  end 

  def create
    @gallery.new(gallery_params)
    if @gallery.save
      render :json => @gallery
    else 
      render :json => {status: 422, error: 'Unable to create gallery'}
    end 
  end

  private

  def gallery_params
    params.require(:gallery).permit(:id, :name, :max_paintings, :email, :phone_number, :address [:street_address, :city, :state, :zip])
  end 
end
