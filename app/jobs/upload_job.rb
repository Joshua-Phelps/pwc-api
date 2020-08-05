class UploadJob < ApplicationJob

  def upload_to_db
    require "json"
    file = File.open "/Users/joshuaphelps/Desktop/paws.json"
    animal_data = JSON.load file
  end 

end