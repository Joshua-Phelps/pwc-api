class CardGeneratorSerializer < ActiveModel::Serializer
  attributes :id, :description, :name,, :photos, :shelter, :file_path

  def photos
    object.photos.map do |photo|
      photo.original_url
    end 
  end 

end