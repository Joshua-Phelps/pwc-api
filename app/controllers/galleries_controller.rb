class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
    render :json => @galleries
  end

  def show
    @gallery = Gallery.find(gallery_params[:id])
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

  def show
    gallery = Gallery.find(gallery_params[:id])
    render :json => {gallery: gallery, current_paintings: gallery.current_paintings }
  end

  private

  def gallery_params
    params.require(:gallery).permit(:id, :address, :name, :max_paintings)
  end 
end
