class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
    render :json => @animals, each_serializer: AnimalIndexSerializer
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      render :json => @animal
    else 
      error_message
    end 
  end

  def get_by_name
    @animals = Animal.where(name: params[:name])
    if @animals.length > 0
      render :json => @animals
    else 
      error_message
    end 
  end 

  def show
    @animal = Animal.find(params[:id])
    if @animal
      render :json => @animal, serializer: AnimalFullSerializer
    else 
      error_message
    end 
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      render :json => @animal, serializer: AnimalFullSerializer
    else 
      error_message
    end 
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.paintings.destroy_all
    @animal.photos.destroy_all
    @animal.destroy
    render :json => {message: 'Animal destroyed!'}
  end

  def update_profile_photo
    @animal = Animal.find(params[:id])
    @photo = Photo.find(animal_params[:profile_photo_id])
    if @animal && @photo
      @animal.profile_photo_id = @photo.id
      if @animal.save
        render :json => @animal, serializer: AnimalFullSerializer
      else
        error_message
      end 
    else 
      error_message
    end 
  end 

  private

  def animal_params
    params.require(:animal).permit(:id, :external_id, :description, :name, :age, :gender, :shelter_id, :profile_photo_id, :animal_type, :canvas_photo_id, :canvas_printed)
  end 
end
