class PhotosController < ApplicationController

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      render :json => @photo
    else 
      error_message
    end 
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo
      render :json => @photo
    else 
      error_message
    end 
  end

  def create_canvas_photo
    @animal = Animal.find(params[:animal_id])
    if @animal
      @photo = Photo.new(photo_params)
      if @photo.save
        @animal.canvas_photo_id = @photo.id 
        @animal.save 
        render :json => @animal
      else 
        error_message
      end 
    else
      error_message
    end 
  end 

  def full_background
    # @photos = Photo.where(bkgd_removed: false)
    @animals = Animal.where(canvas_photo_id: nil)
    render :json => @animals, each_serializer: AnimalPhotosFullBgSerializer 
  end 

  def print_ready
    @photos = Photo.where(bkgd_removed: true)
    render :json => @photos
  end 
  
  private 

  def photo_params
    params.require(:photo).permit(:id, :animal_id, :url, :size, :bkgd_removed)
  end 
end
