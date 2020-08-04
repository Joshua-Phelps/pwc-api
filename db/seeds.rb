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
User.destroy_all

User.create(username: "Admin", email: 'joshua.phelps89@gmail.com', permission_level: 3, password: 'admin')

shelters = [{external_id:"WA52", name: "Adams County Pet Rescue", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA07", name: "Benton Franklin Animal Services", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA669", name: "Binky Bunny Tales", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA135", name: "CASA (Camano Animal Shelter Association)", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA96", name: "Cascade Animal Protection Society", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA101", name: "Cat Tails Rescue", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA650",  name: "Dog Gone Seattle", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA538",  name: "ECPR (Emerald City Pet Rescue)", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA134",  name: "EAS (Everett Animal Services)", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA562",  name: "Forever Home Dog Rescue", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA673",  name: "Kitty Korner Rescue (Pet Café -Edmonds)", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA41", name: "itsap Humane Society", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA119",  name: "Meow Cat Rescu", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA606",  name: "Must Love Boxers", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA132",  name: "NOAH (Northwest Organization for Animal Help", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA167",  name: "Pasados Safe Have", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA59",  name: "PAWS and PAWS Cat Cit", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA70",  name: "Purrfect Pals Cat Sanctuar", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA73",  name: "Puyallup Animal Rescu", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA252",  name: "RASKC (Regional Animal Services of King County", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA622",  name: "Rompin Paw", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA630",  name: "Save-a-Mut", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA40",  name: "SAFeR (Seattle Area Feline Rescue", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA06",  name: "Seattle Humane", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA400",  name: "Seattle Persian and Himalayan", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA60",  name: "SVHS (Skagit Valley Humane)", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA544",  name: "Smidget Rescue", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA621",  name: "Useless Bay", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA47",  name: "WAMAL (Washington Alaska Malamute Adoption League)", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}},
            {external_id: "WA175",  name: "Yakima Valley Pet Rescue", phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'street address', city: 'City', state: 'WA', zip: 'zip code'}}]

galleries = [
  {name: 'Bleachers', max_paintings: 10, phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}},
  {name: 'Bob Drewel', max_paintings: 10, phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}},
  {name: 'CCR', max_paintings: 10, phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}},
  {name: 'ECPR', max_paintings: 10, phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}},
  {name: 'Everett Mall', max_paintings: 10, phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}},
  {name: 'FM 164th', max_paintings: 10, phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}},
  {name: 'FM 196th', max_paintings: 10, phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}},
  {name: 'FM Everett', max_paintings: 10, phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}},
  {name: 'FM Marysville', max_paintings: 10, phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}},
  {name: 'FM Snoho', max_paintings: 10, phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}},
  {name: 'FM Sth Lake', max_paintings: 10, phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}},
  {name: 'FW', max_paintings: 10, phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}},
  {name: 'Gro WA', max_paintings: 10, phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}},
  {name: 'Home', max_paintings: 10, phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}},
  {name: 'PAWS', max_paintings: 10, phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}},
  {name: 'Peoples', max_paintings: 10, phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}},
  {name: 'Safer', max_paintings: 10, phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}},
  {name: "Schack H'Arts", max_paintings: 10, phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}},
  {name: 'Univ Heights', max_paintings: 10, phone_number: '555-555-5555', email: 'placerEmail@gmail.com', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}},
]

paint_locations = [
  {name: 'Ashley Point', address: {street_address: '11117 20th St NE',  city:'Lake Stevens', state:'WA', zip:'98258'}, phone_number: '425-366-8653', email: 'placerEmail@gmail.com'},
  {name: 'Brookedale', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}, phone_number: '555-555-5555', email: 'placerEmail@gmail.com'},
  {name: 'Callahan House', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}, phone_number: '555-555-5555', email: 'placerEmail@gmail.com'},
  {name: 'Everett Mall', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}, phone_number: '555-555-5555', email: 'placerEmail@gmail.com'},
  {name: 'ECPR', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}, phone_number: '555-555-5555', email: 'placerEmail@gmail.com'},
  {name: 'Fairwinds', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}, phone_number: '555-555-5555', email: 'placerEmail@gmail.com'},
  {name: 'Garden Ct', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}, phone_number: '555-555-5555', email: 'placerEmail@gmail.com'},
  {name: 'Pacifica-LY', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}, phone_number: '555-555-5555', email: 'placerEmail@gmail.com'},
  {name: 'South Pointe', address: {street_address: 'Street Address',  city: 'City', state: 'WA', zip: 'Zip code'}, phone_number: '555-555-5555', email: 'placerEmail@gmail.com'},
]


shelters.each do |shel|
  Shelter.create(external_id: shel[:external_id], name: shel[:name], phone_number: shel[:phone_number], email: shel[:email], address: shel[:address])
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

  @shelter = Shelter.find_or_create_by(external_id: data["Organization_ID"])

  @animal = Animal.create(
    name: data["Name"], 
    external_id: data["ID"], 
    animal_type: data["Type"], 
    age: data["Age"],
    gender: data["Gender"],
    description: data["Description"],
    shelter_id: @shelter.id,
  )

  if @animal 
    animal_count += 1

    if data["Photos"]

      data["Photos"].each_with_index do |ph, idx|
        if ph['Full'] && ph["LocalPath"] 
          if idx === 0 
            created_photo = Photo.new(animal_id: @animal.id, original_url: ph["Full"], file_path: ph["LocalPath"], size: 'Full')
            if created_photo.save 
              @animal.profile_photo_id = created_photo.id
              @animal.save
            end 
            photo_count += 1 
          else 
            Photo.create(animal_id: @animal.id, original_url: ph["Full"], file_path: ph["LocalPath"], size: 'Full')
            photo_count += 1 
          end 
        end 
      end  
    end 
  end 
end 

puts animal_count.to_s + ' Animals and ' + photo_count.to_s + ' Photos created'