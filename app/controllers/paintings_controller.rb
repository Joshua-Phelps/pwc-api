class PaintingsController < ApplicationController
  
  def create
    @painting = Painting.new(painting_params)
    if @painting.save
      render :json => @painting
    else 
      render :json => {status: 422, error: 'Unable to create painting!'}
    end 
  end

  def show
    @painting = Painting.find(params[:id])
    if @painting
      render :json => @painting
    else 
      render :json => {status: 422, error: 'Unable to find painting!'}
    end 
  end

  def update
    @painting = Painting.find(params[:id])
    if @painting.update(painting_params)
      render :json => @painting
    else 
      render :json => {status: 422, error: 'Unable to update!'}
    end 
  end

  def destroy
    @painting = Painting.find(params[:id])
    if @painting.destroy
      render :json => {msg: "Successfully deleted"}
    else 
      render :json => {status: 422, error: 'Unable to delete!'}
    end 
  end

  private

  def painting_params
    params.require(:painting).permit(:id, :animal_id, :paint_location_id, :painting_url, :painting_status, :painter, :gallery_id, :card_stock)
  end 
end
