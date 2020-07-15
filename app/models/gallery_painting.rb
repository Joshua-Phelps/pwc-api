class GalleryPainting < ApplicationRecord
  belongs_to :painting 
  belongs_to :gallery 
  has_one :animal, through: :painting
end
