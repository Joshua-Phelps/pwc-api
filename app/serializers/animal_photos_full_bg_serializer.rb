class AnimalPhotosFullBgSerializer < ActiveModel::Serializer
  attributes :photos, :name, :canvas_photo, :profile_photo, :animal_id


    def animal_id
      object.id
    end 
end