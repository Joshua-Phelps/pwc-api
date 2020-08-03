class CardGeneratorSerializer < ActiveModel::Serializer
  attributes :id, :description, :name, :animal_type, :gender, :photos, :shelter, :photo_local_path

  def photos
    object.photos.map do |photo|
      photo.original_url
    end 
  end 

end