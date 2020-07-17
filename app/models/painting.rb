class Painting < ApplicationRecord
  belongs_to :animal
  belongs_to :paint_location, optional: true
  belongs_to :gallery, optional: true 
  # accepts_nested_attributes_for :galleries
end
