class AnimalFullSerializer < ActiveModel::Serializer
  attributes :id, :animal_type, :age, :gender, :external_id, :name, :photo_status, :description, :photos, :shelter, :paintings


end
