class Animal < ApplicationRecord
  has_many :paintings 
  has_many :photos
  belongs_to :shelter
  has_many :gallery_paintings, through: :paintings
  has_many :galleries, through: :gallery_painting

  def currently_on_display
    gallery_paintings = self.gallery_paintings.where(currently_displayed: true)
    if gallery_paintings 
      galleries = gallery_paintings.map  do |gp| 
        { gallery_id: gp.gallery.id, painting: gp.painting } 
      end 
    end 
  end 
end
