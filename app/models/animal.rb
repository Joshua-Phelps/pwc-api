class Animal < ApplicationRecord
  has_many :paintings 
  has_many :photos
  belongs_to :canvas_photo, :class_name => 'Photo', :foreign_key => 'canvas_photo_id', required: false
  belongs_to :profile_photo, :class_name => 'Photo', :foreign_key => 'profile_photo_id', required: false
  belongs_to :shelter
  has_many :galleries, through: :paintings

  # def self.full_background
  #   Animal.where()
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
