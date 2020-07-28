class ShelterSerializer < ActiveModel::Serializer
  attributes :id, :external_id, :name, :animals, :address, :email, :phone_number
end
