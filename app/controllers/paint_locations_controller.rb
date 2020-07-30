class PaintLocationsController < ApplicationController

  def index
    @paint_locs = PaintLocation.all
    render :json => @paint_locs
  end

  def create
    @paint_loc = PaintLocation.new(paint_location_params)
    if @paint_loc.save
      render :json => @paint_loc
    else 
      error_message
    end 
  end

  def show 
    @paint_loc = PaintLocation.find(params[:id])
    if @paint_loc
      render :json => @paint_loc
    else
      rerror_message
    end 
    # render :json => @paint_loc, serializer: CompletePaintLocationSerializer
  end 


  private 

  def paint_location_params
    params.require(:paint_location).permit(:id, :name, :address => [:street_address, :city, :state, :zip])
  end 

end
