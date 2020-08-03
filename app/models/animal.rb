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

  def min_info_photos
    new_photos = self.photos.map do |ph|
      new_obj = {}
      new_obj[:id] = ph[:id]
      new_obj[:file_path] = ph[:file_path]
      if ph.google_drive_url
        google_url_start = 'https://drive.google.com/uc?export=view&id='
        url_end = ph.google_drive_url.split('https://drive.google.com/file/d/')[1].split('/view?usp=sharing')[0];
        new_url = google_url_start + url_end 
      else
        new_url = ph.original_url
      end
      new_obj[:url] = new_url 
      new_obj
    end 
    new_photos
  end 

 
end
