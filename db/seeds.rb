# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

Booking.destroy_all
Cat.destroy_all
User.destroy_all

puts "Cleanning!!!!!!!!!!!!!!!!!"

matthieu = User.create!(email:'matthieu@lewagon.com', password: 'password', first_name: 'Matthieu', last_name:'Delegrange')
valentin = User.create!(email:'burval3@gmail.com', password: 'password', first_name: 'Valentin', last_name:'Burgaud')
pierre = User.create!(email:'pierre@lewagon.com', password: 'password', first_name: 'Pierre', last_name:'Hamon')
yassine = User.create!(email:'yassinejay@hotmail.fr', password: 'password', first_name: 'Yassine', last_name:'Jay')

puts "Users Created"

cat1 = Cat.create!(user: matthieu, name: Faker::Cat.name, description: Faker::Cat.registry, breed: Faker::Cat.breed, price_per_day: 15, photo: File.open(Rails.root.join('db/fixtures/cats/cat1.jpg')))
cat2 = Cat.create!(user: valentin, name: Faker::Cat.name, description: Faker::Cat.registry, breed: Faker::Cat.breed, price_per_day: 10, photo: File.open(Rails.root.join('db/fixtures/cats/cat1.jpg')))
cat3 = Cat.create!(user: yassine, name: Faker::Cat.name, description: Faker::Cat.registry, breed: Faker::Cat.breed, price_per_day: 20, photo: File.open(Rails.root.join('db/fixtures/cats/cat1.jpg')))
cat4 = Cat.create!(user: pierre, name: Faker::Cat.name, description: Faker::Cat.registry, breed: Faker::Cat.breed, price_per_day: 15, photo: File.open(Rails.root.join('db/fixtures/cats/cat1.jpg')))
cat5 = Cat.create!(user: matthieu, name: Faker::Cat.name, description: Faker::Cat.registry, breed: Faker::Cat.breed, price_per_day: 17, photo: File.open(Rails.root.join('db/fixtures/cats/cat1.jpg')))
cat6 = Cat.create!(user: pierre, name: Faker::Cat.name, description: Faker::Cat.registry, breed: Faker::Cat.breed, price_per_day: 16, photo: File.open(Rails.root.join('db/fixtures/cats/cat1.jpg')))
cat7 = Cat.create!(user: valentin, name: Faker::Cat.name, description: Faker::Cat.registry, breed: Faker::Cat.breed, price_per_day: 14, photo: File.open(Rails.root.join('db/fixtures/cats/cat1.jpg')))
cat8 = Cat.create!(user: yassine, name: Faker::Cat.name, description: Faker::Cat.registry, breed: Faker::Cat.breed, price_per_day: 12, photo: File.open(Rails.root.join('db/fixtures/cats/cat1.jpg')))
cat9 = Cat.create!(user: pierre, name: Faker::Cat.name, description: Faker::Cat.registry, breed: Faker::Cat.breed, price_per_day: 19, photo: File.open(Rails.root.join('db/fixtures/cats/cat1.jpg')))
cat10 = Cat.create!(user: valentin, name: Faker::Cat.name, description: Faker::Cat.registry, breed: Faker::Cat.breed, price_per_day: 20, photo: File.open(Rails.root.join('db/fixtures/cats/cat1.jpg')))

puts "Cats Created"

booking_validate = Booking.create!(user: valentin  , cat: cat1 ,begin_date: '2018-11-20' , end_date: '2018-11-26', total_price: 90,  status: 'valid')
booking_validate = Booking.create!(user: matthieu , cat: cat2 ,begin_date: '2018-11-16' , end_date: '2018-12-02', total_price: 160,  status: 'pending')
booking_validate = Booking.create!(user: pierre , cat: cat5 ,begin_date: '2018-12-20' , end_date: '2018-12-29', total_price: 153, status: 'deny')

puts "Bookings Created"

puts "Finished"