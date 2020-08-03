class PhotosController < ApplicationController

  def update
    @photo = Photo.find(params[:id])
    if @photo
      render :json => @photo
    else 
      error_message
    end 
  end

  def full_background
    byebug
    # @photos = Photo.where(bkgd_removed: false)
    # render :json => @photos
  end 

  def print_ready
    # @photos = Photo.where(bkgd_removed: true)
    # render :json => @photos
  end 
  
  private 

  def photo_params
    params.require(:photo).permit(:id, :animal_id, :url, :size, :bkgd_removed)
  end 
end
