class PhotosController < ApplicationController

  def create
    photo = Photo.new(photo_params)
    if photo.save
      render :json => photo
    else 
      error_message
    end 
  end

  def update
    photo = Photo.find(params[:id])
    if photo
      photo.update(photo_params)
      render :json => photo
    else 
      error_message
    end 
  end
  
  private 

  def photo_params
    params.require(:photo).permit(:id, :animal_id, :original_url, :size, :google_drive_url, :profile_photo_id)
  end 
end
