class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :external_id, :name, :description, :profile_photo, :shelter_id, :total_paintings, :canvas_photo

  def shelter_id
    object.shelter.id
  end 


  def total_paintings
    object.paintings.length
  end 

end
