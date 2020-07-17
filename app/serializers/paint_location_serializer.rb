class PaintLocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :email, :phone_number
end
