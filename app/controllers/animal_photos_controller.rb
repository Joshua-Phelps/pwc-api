class AnimalPhotosController < ApplicationController

  def create_canvas_photo
    animal = Animal.find(params[:animal_id])
    if animal
      photo = Photo.new(animal_photo_params)
      if photo.save
        animal.canvas_photo_id = photo.id 
        animal.save 
        render :json => animal, serializer: AnimalFullSerializer
      else 
        error_message
      end 
    else
      error_message
    end 
  end 

  def update_canvas_photo
    photo = Photo.find(params[:id])
    if photo
      if photo.update(animal_photo_params)
        render :json => photo.animal, serializer: AnimalFullSerializer
      else 
        error_message
      end 
    else
      error_message
    end 
  end 

  def update_profile_photo
    photo = Photo.find(params[:photo_id])
    if photo
      animal = photo.animal
      if animal.update(animal_photo_params)
        render :json => animal, serializer: AnimalFullSerializer
      else
        error_message
      end 
    else 
      error_message
    end 
  end 

  def full_background
    animals = Animal.where(canvas_photo_id: nil)
    render :json => animals, each_serializer: AnimalPhotosFullBgSerializer 
  end 

  def print_ready
    animals = Animal.where.not(canvas_photo_id: nil, canvas_printed: true)
    render :json => animals, each_serializer: AnimalPhotosPrintReadySerializer 
  end 
  
  private 

  def animal_photo_params
    params.require(:animal_photo).permit(:id, :profile_photo_id, :animal_id, :original_url, :size, :bkgd_removed, :google_drive_url)
  end 

end