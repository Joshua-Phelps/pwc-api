class AnimalFullSerializer < ActiveModel::Serializer
  attributes :id, :animal_type, :age, :gender, :external_id, :name, :description, :photos, :shelter, :paintings, :profile_photo, :canvas_photo

  def photos
    object.photos.find_all{|ph| ph.bkgd_removed === false}
  end 

end
