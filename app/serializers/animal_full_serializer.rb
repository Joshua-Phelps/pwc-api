class AnimalFullSerializer < ActiveModel::Serializer
  attributes :id, :animal_type, :age, :gender, :external_id, :name, :description, :photos, :shelter, :paintings, :profile_photo_id, :canvas_photo_id

  def photos
    object.min_info_photos
  end 

end
