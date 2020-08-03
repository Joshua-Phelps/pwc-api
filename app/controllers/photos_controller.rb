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
        render :json => @animal, serializer: AnimalFullSerializer
      else 
        error_message
      end 
    else
      error_message
    end 
  end 

  def update_canvas_photo
    @animal = Animal.find(params[:animal_id])
    @photo = @animal.canvas_photo
    if @photo
      if @photo.update(photo_params)
        render :json => @animal, serializer: AnimalFullSerializer
      else 
        error_message
      end 
    else
      error_message
    end 
  end 

  def full_background
    @animals = Animal.where(canvas_photo_id: nil)
    render :json => @animals, each_serializer: AnimalPhotosFullBgSerializer 
  end 

  def print_ready
    @animals = Animal.where.not(canvas_photo_id: nil, canvas_printed: true)
    render :json => @animals, each_serializer: AnimalPhotosPrintReadySerializer 
  end 
  
  private 

  def photo_params
    params.require(:photo).permit(:id, :animal_id, :original_url, :size, :bkgd_removed, :google_drive_url)
  end 
end
