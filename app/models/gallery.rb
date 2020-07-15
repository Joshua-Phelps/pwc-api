class Gallery < ApplicationRecord
  has_many :gallery_paintings
  has_many :paintings, through: :gallery_paintings
end
