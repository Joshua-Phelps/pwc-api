class Painting < ApplicationRecord
  belongs_to :animal
  belongs_to :paint_location, optional: true
  has_many :gallery_paintings
  has_many :galleries, through: :gallery_paintings
end
