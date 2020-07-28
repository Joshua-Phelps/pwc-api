class ShelterSerializer < ActiveModel::Serializer
  attributes :id, :external_id, :name, :address, :email, :phone_number
  has_many :animals 

  # def animals 
  #   object.animals.map do |a|
  #     {name: a.name, a.photos}
  #   end 
  # end 
end

