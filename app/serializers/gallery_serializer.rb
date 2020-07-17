class GallerySerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :email, :phone_number

  def current_paintings
    object.current_paintings
  end 
end
