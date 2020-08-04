class PaintingsController < ApplicationController
  
  def create
    painting = Painting.new(painting_params)
    if painting.save
      render :json => painting
    else 
      error_message
    end 
  end

  def show
    painting = Painting.find(params[:id])
    if painting
      render :json => painting
    else 
      error_message
    end 
  end

  def update
    painting = Painting.find(params[:id])
    if painting.update(painting_params)
      render :json => painting
    else 
      error_message
    end 
  end

  def destroy
    painting = Painting.find(params[:id])
    if painting.destroy
      render :json => {msg: "Successfully deleted"}
    else 
      error_message
    end 
  end

  private

  def painting_params
    params.require(:painting).permit(:id, :animal_id, :paint_location_id, :painting_url, :painting_status, :painter, :gallery_id, :card_stock)
  end 
end
