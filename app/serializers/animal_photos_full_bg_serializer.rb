class AnimalPhotosFullBgSerializer < ActiveModel::Serializer
  attributes :photos, :canvas_photo_id, :profile_photo_id, :animal


    def animal
      object.slice(:id, :name)
    end 

    def photos
      object.min_info_photos
    end 

end