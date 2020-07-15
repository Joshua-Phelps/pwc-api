class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
    render :json => @shelters
  end

  def show
    @shelter = Shelter.find(params[:id])
    if @shelter
      render :json => @shelter
    else 
      render json => {status: 404, message: 'Shelter not found!'}
    end 
  end

  private

  def shelter_params
    params.require(:shelter).permit(:id, :external_id, :name)
  end 
end
