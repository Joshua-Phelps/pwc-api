class GallerySerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :email, :phone_number, :paintings, :max_paintings

  def paintings
    allPaintings = object.paintings.map do |paint|
      ActiveModelSerializers::SerializableResource.new(paint)
    end 
    allPaintings
  end 

end
