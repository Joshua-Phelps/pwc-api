class AnimalIndexSerializer < ActiveModel::Serializer
  attributes :id, :animal_type, :external_id, :name, :photo_url, :shelter_name, :shelter_id, :total_paintings, :photo_status


  def total_paintings
    object.paintings.length
  end 

  def photo_url
    if object.photos[2]
      object.photos[2].original_url
    else 
      object.photos
    end 
  end 

  def shelter_name
    object.shelter.name
  end 

  def shelter_id
    object.shelter.id
  end

end
