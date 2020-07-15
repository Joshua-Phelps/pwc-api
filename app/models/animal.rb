class Animal < ApplicationRecord
  has_many :paintings 
  has_many :photos
  belongs_to :shelter
  has_many :gallery_paintings, through: :paintings
  has_many :galleries, through: :gallery_painting
end
