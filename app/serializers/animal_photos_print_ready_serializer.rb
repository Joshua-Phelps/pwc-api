class AnimalPhotosPrintReadySerializer < ActiveModel::Serializer
  attributes :canvas_photo, :animal, :url

    def animal
      object.slice(:id, :name)
    end 

    def url
      object.canvas_photo.get_visible_google_drive_url
    end 

end