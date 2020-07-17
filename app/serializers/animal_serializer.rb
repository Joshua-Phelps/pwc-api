class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :animal_type, :age, :gender, :external_id, :name, :photo_status, :description, :photos, :complete_photos, :currently_on_display, :shelter

  def complete_photos
    object.photos.where(complete: true)
  end 

  def currently_on_display
    object.currently_on_display
  end 
end
