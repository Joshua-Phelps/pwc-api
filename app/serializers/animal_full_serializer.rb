class AnimalFullSerializer < ActiveModel::Serializer
  attributes :id, :external_id, :name, :description, :photos, :shelter, :paintings, :profile_photo_id, :canvas_photo_id

  def photos
    object.min_info_photos
  end 

  def paintings
    object.min_info_paintings
  end 

end
