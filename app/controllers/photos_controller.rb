class PhotosController < ApplicationController
  
  private 

  def photo_params
    params.require(:photo).permit(:id, :animal_id, :url, :size, :complete)
  end 
end
