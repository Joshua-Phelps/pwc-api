class Photo < ApplicationRecord
  belongs_to :animal


  def get_visible_google_drive_url
    google_url_start = 'https://drive.google.com/uc?export=view&id='
    url_end = self.google_drive_url.split('https://drive.google.com/file/d/')[1].split('/view?usp=sharing')[0];
    new_url = google_url_start + url_end 
  end 


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
