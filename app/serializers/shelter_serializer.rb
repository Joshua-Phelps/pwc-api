class ShelterSerializer < ActiveModel::Serializer
  attributes :id, :external_id, :name, :address, :email, :phone_number
  has_many :animals 

end

