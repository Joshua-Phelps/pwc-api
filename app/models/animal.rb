class Animal < ApplicationRecord
  has_many :paintings, :dependent => :destroy
  has_many :photos, :dependent => :destroy
  belongs_to :canvas_photo, :class_name => 'Photo', :foreign_key => 'canvas_photo_id', required: false
  belongs_to :profile_photo, :class_name => 'Photo', :foreign_key => 'profile_photo_id', required: false
  belongs_to :shelter
  has_many :galleries, through: :paintings
  accepts_nested_attributes_for :photos

  def min_info_photos
    new_photos = self.photos.map do |ph|
      new_obj = {}
      new_obj[:id] = ph[:id]
      new_obj[:file_path] = ph[:file_path]
      if ph.google_drive_url
        new_url = ph.get_visible_google_drive_url
      else
        new_url = ph.original_url
      end
      new_obj[:url] = new_url 
      new_obj
    end 
    new_photos
  end 

  def self.add_to_db(file)
    # require "json"
    animal_data = File.read file
    animal_data = JSON.parse(animal_data)

    animal_count = 0
    photo_count = 0

    animal_data.each do |data|
      shelter = Shelter.find_or_create_by(external_id: data["Organization_ID"])
      description_data =  Nokogiri::HTML.parse data["Description"]
      description_data = description_data.text.gsub(/&#39;/, "'")
      description_data = description_data.gsub(/&#34;/, '"')
      # description_data = description_data.gsub(";", "")   
      
      animal = Animal.find_by(external_id: data["ID"])
      if !animal 
        animal = Animal.create(
        name: data["Name"], 
        external_id: data["ID"], 
        description: description_data,
        shelter_id: shelter.id,
        )
        animal && animal_count += 1
      end 

      if animal && data["Photos"]
          data["Photos"].each_with_index do |ph, idx|
          if ph['Full'] && ph["LocalPath"] 
            if idx === 0 
                created_photo = Photo.new(animal_id: animal.id, original_url: ph["Full"], file_path: ph["LocalPath"], size: 'Full')
                if created_photo.save 
                  animal.profile_photo_id = created_photo.id
                  if animal.save
                    photo_count += 1 
                  end 
                end 

            else 
                new_photo = Photo.create(animal_id: animal.id, original_url: ph["Full"], file_path: ph["LocalPath"], size: 'Full')
                if new_photo
                  photo_count += 1 
                end 
            end  
          end  
        end 
      end
    end  
    puts animal_count.to_s + ' Animals and ' + photo_count.to_s + ' Photos created'
    animal_count
  end 

 
end
