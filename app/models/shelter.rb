class Shelter < ApplicationRecord
  has_many :animals
  has_many :photos, through: :animals
end
