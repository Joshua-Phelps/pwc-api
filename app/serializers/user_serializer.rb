class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :permission_level

end
