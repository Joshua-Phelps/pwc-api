class Painting < ApplicationRecord
  belongs_to :animal
  belongs_to :paint_location, optional: true
  belongs_to :gallery, optional: true 
  validate :google_drive_validation

  def get_visible_google_drive_url
    if self.google_drive_url[0..31] === "https://drive.google.com/file/d/"
      google_url_start = 'https://drive.google.com/uc?export=view&id='
      url_end = self.google_drive_url.split('https://drive.google.com/file/d/')[1].split('/view?usp=sharing')[0];
      new_url = google_url_start + url_end 
    else 
      ''
    end 
  end
  
  def visible_url(url)
    if url[0..31] === "https://drive.google.com/file/d/"
    google_url_start = 'https://drive.google.com/uc?export=view&id='
    url_end = url.split('https://drive.google.com/file/d/')[1].split('/view?usp=sharing')[0];
    new_url = google_url_start + url_end 
    else 
      ''
    end 
  end 

  private 


  def google_drive_validated?
    google_drive_url[0..31] != "https://drive.google.com/file/d/" || google_drive_url != ""
  end 

  def google_drive_validation
    unless google_drive_validated?
        errors.add(:google_drive_url, 'Must be a valid original google drive url or be empty')
    end 
  end 
end
