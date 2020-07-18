class GallerySerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :email, :phone_number, :paintings, :max_paintings

  def paintings
    allPaintings = object.paintings.map do |p|
      ActiveModelSerializers::SerializableResource.new(p)
    end 
    allPaintings
  end 

end
