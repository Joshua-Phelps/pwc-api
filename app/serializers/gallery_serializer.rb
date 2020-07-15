class GallerySerializer < ActiveModel::Serializer
  attributes :id, :name, :address

  def current_paintings
    object.current_paintings
  end 
end
