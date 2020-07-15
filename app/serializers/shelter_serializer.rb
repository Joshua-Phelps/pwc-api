class ShelterSerializer < ActiveModel::Serializer
  attributes :id, :external_id, :name, :animals
end
