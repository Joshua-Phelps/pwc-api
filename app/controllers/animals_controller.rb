class AnimalsController < ApplicationController

  def create
    animal = Animal.new(animal_params)
    if animal.save
      render :json => animal
    else 
      error_message
    end 
  end

  def no_canvas_photos
    animals = Animal.where(canvas_photo_id: nil)
    render :json => animals, each_serializer: AnimalPhotosFullBgSerializer 
  end 

  def print_ready_photos
    animals = Animal.where.not(canvas_photo_id: nil, canvas_printed: true)
    render :json => animals, each_serializer: AnimalPhotosPrintReadySerializer 
  end 

  def get_by_name
    animals = Animal.where(name: params[:name])
    if animals.length > 0
      render :json => animals
    else 
      error_message
    end 
  end 

  def show
    animal = Animal.find(params[:id])
    if animal
      render :json => animal, serializer: AnimalFullSerializer
    else 
      error_message
    end 
  end

  def update
    animal = Animal.find(params[:id])
    if animal.update(animal_params)
      render :json => animal, serializer: AnimalFullSerializer
    else 
      error_message
    end 
  end

  def destroy
    animal = Animal.find(params[:id])
    animal.paintings.destroy_all
    animal.photos.destroy_all
    animal.destroy
    render :json => {message: 'Animal destroyed!'}
  end

  def update_profile_photo
    photo = Photo.find(params[:photo_id])
    if photo
      animal = photo.animal
      animal.profile_photo_id = photo.id
      if animal.save
        render :json => animal, serializer: AnimalFullSerializer
      else
        error_message
      end 
    else 
      error_message
    end 
  end 

  def create_card
    animal = Animal.find(params[:id])
    if animal
      render :json => animal, serializer: CardGeneratorSerializer 
    else 
      error_message
    end 
  end

  def create_canvas_photo
    animal = Animal.find(params[:id])
    if animal
      photo = Photo.new(animal_params[:photo])
      photo.animal_id = animal.id
      if photo.save
        animal.canvas_photo_id = photo.id 
        if animal.save 
        render :json => animal, serializer: AnimalFullSerializer
        else 
          error_message
        end 
      else 
        error_message
      end 
    else
      error_message
    end 
  end 

  # def update_canvas_photo
  #   byebug
  #   photo = Photo.find(params[:photo_id])
  #   if photo
  #     if photo.update(animal_params[:photo])
  #       render :json => photo.animal, serializer: AnimalFullSerializer
  #     else 
  #       error_message
  #     end 
  #   else
  #     error_message
  #   end 
  # end 

  private

  def animal_params
    params.require(:animal).permit(
      :id, 
      :external_id, 
      :description, 
      :name, 
      :shelter_id, 
      :photo_id, 
      :profile_photo_id, 
      :canvas_photo_id, 
      :canvas_printed, 
      :photo => [:file_path, :google_drive_url, :size])
  end 

end
