class Animal < ApplicationRecord
  has_many :paintings 
  has_many :photos
  belongs_to :shelter
  has_many :galleries, through: :paintings

  def currently_on_display
  
  end 
end
