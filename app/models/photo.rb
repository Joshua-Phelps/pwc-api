class Photo < ApplicationRecord
  belongs_to :animal


  # def self.full_background
  #   photos = Photo.where(bkgd_removed: false)
  #   animals = {}
  #   photos.map do |photo|
  #     if animal
  #     if !animals[photo.animal_id] 
  #     animals[photo.animal_id] = photo.animal.photos
  #     end 
  #   end 
  #   animals
  # end 

end
