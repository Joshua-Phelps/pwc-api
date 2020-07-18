class Gallery < ApplicationRecord
  has_many :paintings 
  has_many :animals, through: :paintings
end
