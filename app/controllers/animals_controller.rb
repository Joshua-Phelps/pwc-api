class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
    render :json => @animals, each_serializer: AnimalIndexSerializer
  end

  def get_by_name
    @animals = Animal.where(name: animal_params[:name])
    if @animal
      render :json => { ids: @animals }
    else 
      render :json => {err: 'Unable to Find an Animal with that name'}
    end 
  end 

  def show
    @animal = Animal.find(params[:id])
    if @animal
      render :json => @animal
    else 
      render :json => {status: 422, error: 'Unable to find this animal!'}
    end 
  end

  def update
    @animal = Animal.find(animal_params[:id])
    if @animal.update(animal_params)
      render :json => @animal
    else 
      render :json => {status: 422, error: 'Unable to update!'}
    end 
  end

  def destroy
    @animal = Animal.find(animal_params[:id])
    @animal.paintings.destroy_all
    @animal.photos.destroy_all
    @animal.destroy
    render :json => {message: 'Animal destroyed!'}
  end


  private

  def animal_params
    params.require(:animal).permit(:id, :external_id, :description, :name, :photo_status, :shelter_id, :animal_type)
  end 
end
