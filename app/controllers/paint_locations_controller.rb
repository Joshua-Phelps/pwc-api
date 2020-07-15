class PaintLocationsController < ApplicationController

  def index
    @paint_locs = PaintLocation.all
    render :json => @paint_locs
  end

  def show 
    @paint_loc = PaintLocation.find(params[:id])
    render :json => @paint_loc, serializer: CompletePaintLocationSerializer
  end 

  private 

  def paint_locations_params
    params.require(:paint_location).permit(:id, :name, :address)
  end 

end
