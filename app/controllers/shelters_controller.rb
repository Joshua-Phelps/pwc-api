class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
    render :json => @shelters
  end

  def create
    @shelter = Shelter.new(shelter_params)
    if @shelter.save
      render :json => @shelter
    else 
      error_message
    end 
  end

  def show
    @shelter = Shelter.find(params[:id])
    if @shelter
      render :json => @shelter
    else 
      error_message
    end 
  end

  private

  def shelter_params
    params.require(:shelter).permit(:id, :external_id, :name, :address => [:street_address, :city, :state, :zip])
  end 
end
