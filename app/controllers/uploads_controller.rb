class UploadsController < ApplicationController
 
  def create
    total_animals_created = Animal.add_to_db(params[:data])
    if total_animals_created > 0
      render :json => {success: "Data has been successfully added to the database", animal_count: total_animals_created}, status: 200
    else 
      render error_message
    end 
  end

  private

  def uploads_params
    require(:uploads).permit(:data)
  end 
end
