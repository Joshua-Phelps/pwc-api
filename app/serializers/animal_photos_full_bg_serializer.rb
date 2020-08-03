class AnimalPhotosFullBgSerializer < ActiveModel::Serializer
  attributes :photos, :name, :canvas_photo_id, :profile_photo_id, :animal_id


    def animal_id
      object.id
    end 

    def photos
      object.min_info_photos
    end 

end