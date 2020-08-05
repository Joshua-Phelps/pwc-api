class Photo < ApplicationRecord
  belongs_to :animal


  def get_visible_google_drive_url
    google_url_start = 'https://drive.google.com/uc?export=view&id='
    url_end = self.google_drive_url.split('https://drive.google.com/file/d/')[1].split('/view?usp=sharing')[0];
    new_url = google_url_start + url_end 
  end 

end
