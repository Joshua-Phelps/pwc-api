class UploadsController < ApplicationController
 
  def create
    # if params[:data].content_type == 'application/json'
    #   total_animals_created = Animal.add_to_db(uploads_params[:data])
    #   if total_animals_created > 0
    #     render :json => {success: "Data has been successfully added to the database", animal_count: total_animals_created}, status: 200
    #   else 
    #     render error_message
    #   end 
    # else 
    #   render error_message
    # end
    if params[:data].content_type == 'application/json'
      animal_count = Animal.add_to_db(params[:data])
      if animal_count > 0

        new_animals = Animal.all[(animal_count*-1)..-1]
        render :json => {success: 'animals have been added to the database', animals: new_animals}, status: 200
      else 
        render error_message
      end 
    else 
      render error_message
    end
  end

  private

  def uploads_params
    require(:uploads).permit(:data)
  end 
end
