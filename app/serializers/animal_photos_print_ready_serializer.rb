class AnimalPhotosPrintReadySerializer < ActiveModel::Serializer
  attributes :canvas_photo, :animal

    def animal_id
      object.slice(:id, :name)
    end 

end