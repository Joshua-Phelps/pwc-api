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
Gallery.destroy_all 
Painting.destroy_all
Photo.destroy_all
PaintLocation.destroy_all 

shelters = [["WA52", "Adams County Pet Rescue", 'Unknown', 'Unknown'],
            [ "WA07", "Benton Franklin Animal Services", 'Unknown', 'Unknown'],
            ["WA669", "Binky Bunny Tales", 'Unknown', 'Unknown'],
            ["WA135", "CASA (Camano Animal Shelter Association)", 'Unknown', 'Unknown'],
            ["WA96", "Cascade Animal Protection Society", 'Unknown', 'Unknown'],
            ["WA101", "Cat Tails Rescue", 'Unknown', 'Unknown'],
            ["WA650",  "Dog Gone Seattle", 'Unknown', 'Unknown'],
            ["WA538",  "ECPR (Emerald City Pet Rescue)", 'Unknown', 'Unknown'],
            ["WA134",  "EAS (Everett Animal Services)", 'Unknown', 'Unknown'],
            ["WA562",  "Forever Home Dog Rescue", 'Unknown', 'Unknown'],
            ["WA673",  "Kitty Korner Rescue (Pet Café -Edmonds)", 'Unknown', 'Unknown'],
            ["WA41", "itsap Humane Society", 'Unknown', 'Unknown'],
            ["WA119",  "Meow Cat Rescu", 'Unknown', 'Unknown'],
            ["WA606",  "Must Love Boxers", 'Unknown', 'Unknown'],
            ["WA132",  "NOAH (Northwest Organization for Animal Help", 'Unknown', 'Unknown'],
            ["WA167",  "Pasados Safe Have", 'Unknown', 'Unknown'],
            ["WA59",  "PAWS and PAWS Cat Cit", 'Unknown', 'Unknown'],
            ["WA70",  "Purrfect Pals Cat Sanctuar", 'Unknown', 'Unknown'],
            ["WA73",  "Puyallup Animal Rescu", 'Unknown', 'Unknown'],
            ["WA252",  "RASKC (Regional Animal Services of King County", 'Unknown', 'Unknown'],
            ["WA622",  "Rompin Paw", 'Unknown', 'Unknown'],
            ["WA630",  "Save-a-Mut", 'Unknown', 'Unknown'],
            ["WA40",  "SAFeR (Seattle Area Feline Rescue", 'Unknown', 'Unknown'],
            ["WA06",  "Seattle Humane", 'Unknown', 'Unknown'],
            ["WA400",  "Seattle Persian and Himalayan", 'Unknown', 'Unknown'],
            ["WA60",  "SVHS (Skagit Valley Humane)", 'Unknown', 'Unknown'],
            ["WA544",  "Smidget Rescue", 'Unknown', 'Unknown'],
            ["WA621",  "Useless Bay", 'Unknown', 'Unknown'],
            ["WA47",  "WAMAL (Washington Alaska Malamute Adoption League)", 'Unknown', 'Unknown'],
            ["WA175",  "Yakima Valley Pet Rescue", 'Unknown', 'Unknown']]

galleries = [
  {name: 'Bleachers', address: 'some address', max_paintings: 10, phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'Bob Drewel', address: 'some address', max_paintings: 10, phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'CCR', address: 'some address', max_paintings: 10, phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'ECPR', address: 'some address', max_paintings: 10, phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'Everett Mall', address: 'some address', max_paintings: 10, phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'FM 164th', address: 'some address', max_paintings: 10, phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'FM 196th', address: 'some address', max_paintings: 10, phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'FM Everett', address: 'some address', max_paintings: 10, phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'FM Marysville', address: 'some address', max_paintings: 10, phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'FM Snoho', address: 'some address', max_paintings: 10, phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'FM Sth Lake', address: 'some address', max_paintings: 10, phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'FW', address: 'some address', max_paintings: 10, phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'Gro WA', address: 'some address', max_paintings: 10, phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'Home', address: 'some address', max_paintings: 10, phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'PAWS', address: 'some address', max_paintings: 10, phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'Peoples', address: 'some address', max_paintings: 10, phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'Safer', address: 'some address', max_paintings: 10, phone_number: 'unknown phone number', email: 'unknown email'},
  {name: "Schack H'Arts", address: 'some address', max_paintings: 10, phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'Univ Heights', address: 'some address', max_paintings: 10, phone_number: 'unknown phone number', email: 'unknown email'},
]

paint_locations = [
  {name: 'Ashley Point', address: 'unknown address', phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'Brookedale', address: 'unknown address', phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'Callahan House', address: 'unknown address', phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'Everett Mall', address: 'unknown address', phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'ECPR', address: 'unknown address', phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'Fairwinds', address: 'unknown address', phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'Garden Ct', address: 'unknown address', phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'Pacifica-LY', address: 'unknown address', phone_number: 'unknown phone number', email: 'unknown email'},
  {name: 'South Pointe', address: 'unknown address', phone_number: 'unknown phone number', email: 'unknown email'},
]


shelters.each do |shel|
  Shelter.create(external_id: shel[0], name: shel[1], phone_number: shel[2], email: shel[3])
end 

galleries.each do |gal|
  Gallery.create(name: gal[:name], address: gal[:address], max_paintings: gal[:max_paintings], phone_number: gal[:phone_number], email: gal[:email])
end 

paint_locations.each do |pl|
  PaintLocation.create(name: pl[:name], address: pl[:address], email: pl[:email], phone_number: pl[:phone_number])
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