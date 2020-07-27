class PaintLocationsController < ApplicationController

  def index
    @paint_locs = PaintLocation.all
    render :json => @paint_locs
  end

  def show 
    @paint_loc = PaintLocation.find(params[:id])
    if @paint_loc
      render :json => @paint_loc
    else
      render :json => {status: 422, error: 'Unable to find this paint location!'}
    end 
    # render :json => @paint_loc, serializer: CompletePaintLocationSerializer
  end 

  private 

  def paint_locations_params
    params.require(:paint_location).permit(:id, :name, :address)
  end 

end
