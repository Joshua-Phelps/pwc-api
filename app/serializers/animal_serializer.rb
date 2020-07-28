class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :animal_type, :age, :gender, :external_id, :name, :photo_status, :description, :photo_url, :shelter_id, :total_paintings

  def shelter_id
    object.shelter.id
  end 

  def photo_url
    if object.photos[2]
      object.photos[2].url
    elsif object.photos[0]
      object.photos[0].url
    else 
      ''
    end 
  end 

  def total_paintings
    object.paintings.length
  end 

end
