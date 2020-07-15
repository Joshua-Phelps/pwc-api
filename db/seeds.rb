# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"
file = File.open "/Users/joshuaphelps/Desktop/paws.json"
animal_data = JSON.load file

Shelter.destroy_all 
Animal.destroy_all 
GalleryPainting.destroy_all 
Gallery.destroy_all 
Painting.destroy_all
Photo.destroy_all
PaintLocation.destroy_all 

shelters = [["WA52", "Adams County Pet Rescue"],
            [ "WA07", "Benton Franklin Animal Services"],
            ["WA669", "Binky Bunny Tales"],
            ["WA135", "CASA (Camano Animal Shelter Association)"],
            ["WA96", "Cascade Animal Protection Society"],
            ["WA101", "Cat Tails Rescue"],
            ["WA650",  "Dog Gone Seattle"],
            ["WA538",  "ECPR (Emerald City Pet Rescue)"],
            ["WA134",  "EAS (Everett Animal Services)"],
            ["WA562",  "Forever Home Dog Rescue"],
            ["WA673",  "Kitty Korner Rescue (Pet Café -Edmonds)"],
            ["WA41", "itsap Humane Society"],
            ["WA119",  "Meow Cat Rescu"],
            ["WA606",  "Must Love Boxers"],
            ["WA132",  "NOAH (Northwest Organization for Animal Help"],
            ["WA167",  "Pasados Safe Have"],
            ["WA59",  "PAWS and PAWS Cat Cit"],
            ["WA70",  "Purrfect Pals Cat Sanctuar"],
            ["WA73",  "Puyallup Animal Rescu"],
            ["WA252",  "RASKC (Regional Animal Services of King County"],
            ["WA622",  "Rompin Paw"],
            ["WA630",  "Save-a-Mut"],
            ["WA40",  "SAFeR (Seattle Area Feline Rescue"],
            ["WA06",  "Seattle Humane"],
            ["WA400",  "Seattle Persian and Himalayan"],
            ["WA60",  "SVHS (Skagit Valley Humane)"],
            ["WA544",  "Smidget Rescue"],
            ["WA621",  "Useless Bay"],
            ["WA47",  "WAMAL (Washington Alaska Malamute Adoption League)"],
            ["WA175",  "Yakima Valley Pet Rescue"]]

shelters.each do |shel|
  Shelter.create(external_id: shel[0], name: shel[1])
end 

animal_count = 0
photo_count = 0

animal_data.each do |data| 

  @shelter = Shelter.find_by(external_id: data["Organization_ID"])

  @animal = Animal.create(
    name: data["Name"], 
    external_id: data["ID"], 
    animal_type: data["Type"], 
    age: data["age"],
    gender: data["Gender"],
    description: data["Description"],
    shelter_id: @shelter.id,
    photo_status: 'incomplete',
  )
  if @animal 
    animal_count += 1

    if data["Photos"][0]
      if data["Photos"][0]["LocalPath"]
        @animal.photo_local_path = data["Photos"][0]["LocalPath"]
        @animal.save
      end 

      if data["Photos"][0]["Small"]
        Photo.create(animal_id: @animal.id, url: data["Photos"][0]["Small"], size: "small")
        photo_count += 1
      end 

      if data["Photos"][0]["Medium"]
        Photo.create(animal_id: @animal.id, url: data["Photos"][0]["Medium"], size: "medium")
        photo_count += 1
      end 

      if data["Photos"][0]["Large"]
        Photo.create(animal_id: @animal.id, url: data["Photos"][0]["Large"], size: "large")
        photo_count += 1
      end 

      if data["Photos"][0]["Full"]
        Photo.create(animal_id: @animal.id, url: data["Photos"][0]["Full"], size: "Full")
        photo_count += 1
      end 
    end 
  end 
end 

puts animal_count.to_s + ' Animals and ' + photo_count.to_s + ' Photos created'