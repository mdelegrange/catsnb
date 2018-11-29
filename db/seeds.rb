# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

puts "Cleaning bookings..."
Booking.destroy_all
puts "Cleaning cats..."
Cat.destroy_all
puts "Cleaning users..."
User.destroy_all

matthieu     = User.create!(email:'matthieu@lewagon.com', password: 'password', first_name: 'Matthieu', last_name:'Delegrange')
valentin     = User.create!(email:'valentin@lewagon.com', password: 'password', first_name: 'Valentin', last_name:'Burgaud')
pierre       = User.create!(email:'pierre@lewagon.com', password: 'password', first_name: 'Pierre', last_name:'Hamon')
yassine      = User.create!(email:'yassine@lewagon.com', password: 'password', first_name: 'Yassine', last_name:'Jay')
user_renter1 = User.create!(email:'renter1@renter.fr', password: 'password', first_name: Faker::Name.first_name, last_name: Faker::Name.last_name )
user_renter2 = User.create!(email:'renter2@renter.fr', password: 'password', first_name: Faker::Name.first_name, last_name: Faker::Name.last_name )
user_renter3 = User.create!(email:'renter3@renter.fr', password: 'password', first_name: Faker::Name.first_name, last_name: Faker::Name.last_name )

puts "Users Created"

cat1 = Cat.create!(user: matthieu, name: Faker::Cat.name, description: Faker::Cat.registry, breed: Faker::Cat.breed, address: 'Châtelet les Halles, Paris', price_per_day: 15, photo: File.open(Rails.root.join('db/fixtures/cats/cat1.jpg')))
sleep(1)
cat2 = Cat.create!(user: matthieu, name: Faker::Cat.name, description: Faker::Cat.registry, breed: Faker::Cat.breed, address: '2 rue du Général Lanrezac, Nantes', price_per_day: 10, photo: File.open(Rails.root.join('db/fixtures/cats/cat2.jpg')))
sleep(1)
cat3 = Cat.create!(user: yassine, name: Faker::Cat.name, description: Faker::Cat.registry, breed: Faker::Cat.breed, address: 'Bouffay, Nantes', price_per_day: 20, photo: File.open(Rails.root.join('db/fixtures/cats/cat3.jpg')))
sleep(1)
cat4 = Cat.create!(user: yassine, name: Faker::Cat.name, description: Faker::Cat.registry, breed: Faker::Cat.breed, address: 'Angers', price_per_day: 15, photo: File.open(Rails.root.join('db/fixtures/cats/cat4.jpg')))
sleep(1)
cat5 = Cat.create!(user: valentin, name: Faker::Cat.name, description: Faker::Cat.registry, breed: Faker::Cat.breed, address: 'Lyon', price_per_day: 17, photo: File.open(Rails.root.join('db/fixtures/cats/cat5.jpg')))
sleep(1)
cat6 = Cat.create!(user: valentin, name: Faker::Cat.name, description: Faker::Cat.registry, breed: Faker::Cat.breed, address: 'Denfert Rochereau, Paris', price_per_day: 16, photo: File.open(Rails.root.join('db/fixtures/cats/cat6.jpg')))
sleep(1)
cat7 = Cat.create!(user: pierre, name: Faker::Cat.name, description: Faker::Cat.registry, breed: Faker::Cat.breed, address: 'Saint Etienne', price_per_day: 14, photo: File.open(Rails.root.join('db/fixtures/cats/cat7.jpg')))
sleep(1)
cat8 = Cat.create!(user: pierre, name: Faker::Cat.name, description: Faker::Cat.registry, breed: Faker::Cat.breed, address: 'Pornic', price_per_day: 12, photo: File.open(Rails.root.join('db/fixtures/cats/cat8.jpg')))
sleep(1)
cat9 = Cat.create!(user: valentin, name: Faker::Cat.name, description: Faker::Cat.registry, breed: Faker::Cat.breed, address: 'Rezé', price_per_day: 19, photo: File.open(Rails.root.join('db/fixtures/cats/cat9.jpg')))
sleep(1)
cat10 = Cat.create!(user: matthieu, name: Faker::Cat.name, description: Faker::Cat.registry, breed: Faker::Cat.breed, address: '26 boulevard de Stalingrad, Nantes', price_per_day: 20, photo: File.open(Rails.root.join('db/fixtures/cats/cat10.jpg')))
sleep(1)

puts "Cats Created"

booking1 = Booking.create!(user: user_renter1, cat: cat1, begin_date: '2018-11-20', end_date: '2018-11-26', status: 'accepted')
booking2 = Booking.create!(user: user_renter1, cat: cat3, begin_date: '2018-11-16', end_date: '2018-12-02', status: 'pending')
booking3 = Booking.create!(user: user_renter2, cat: cat2, begin_date: '2018-12-20', end_date: '2018-12-29', status: 'denied')
booking4 = Booking.create!(user: user_renter2, cat: cat6, begin_date: '2018-12-28', end_date: '2018-12-29', status: 'pending')
booking5 = Booking.create!(user: user_renter3, cat: cat10, begin_date: '2019-01-15', end_date: '2019-02-15', status: 'pending')
booking6 = Booking.create!(user: user_renter3, cat: cat9, begin_date: '2019-03-20', end_date: '2019-05-20', status: 'pending')
booking7 = Booking.create!(user: matthieu,     cat: cat8, begin_date: '2019-03-20', end_date: '2019-05-20', status: 'pending')

puts "Bookings Created"

puts "Finished"
