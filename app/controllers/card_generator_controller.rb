class CardGeneratorController < ApplicationController

  def show
    animal = Animal.find(params[:id])
    if animal
      render :json => animal, serializer: CardGeneratorSerializer 
    else 
      render :json => 'Unable to find an Animal with that id'
    end 
  end
end
