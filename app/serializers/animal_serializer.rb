class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :animal_type, :age, :gender, :external_id, :name, :photo_status, :description, :photo_url, :shelter_id, :total_paintings

  def shelter_id
    object.shelter.id
  end 

  def photo_url
    object.photos.find_by(profile: true)
  end 

  def total_paintings
    object.paintings.length
  end 

end
