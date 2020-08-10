class PaintLocationsController < ApplicationController

  def index
    paint_locs = PaintLocation.all
    render :json => paint_locs
  end

  def create
    paint_loc = PaintLocation.new(paint_location_params)
    if paint_loc.save
      render :json => paint_loc
    else 
      error_message
    end 
  end

  def show 
    paint_loc = PaintLocation.find(params[:id])
    if paint_loc
      render :json => paint_loc
    else
      rerror_message
    end 
  end 

  def update
    paint_loc = PaintLocation.find(params[:id])
    if paint_loc.update(paint_location_params)
      render :json => paint_loc
    else 
      error_message
    end 
  end


  private 

  def paint_location_params
    params.require(:paint_location).permit(:id, :name, :address, :phone_number, :email => [:street_address, :city, :state, :zip])
  end 

end
