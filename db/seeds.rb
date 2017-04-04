# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

generateValues = 5
Image.delete_all

generateValues.times do |i|
	Image.create!(name: Faker::File.file_name('image',), description: Faker::Lorem.sentence)
end

Product.delete_all

Product.create!(name: 'Galateis Douceur', description: Faker::Lorem.sentence, cost: 137000)#Gel
Product.create!(name: 'Pure Tonic', description: Faker::Lorem.sentence, cost: 121000)#Tonicos
Product.create!(name: 'Cocoa Powder', description: Faker::Lorem.sentence, cost: 137000)#Polvos
Product.create!(name: 'Soft Matte Lip Cream', description: Faker::Lorem.sentence, cost: 39000)#Lipstick
Product.create!(name: 'Grandiose Liner', description: Faker::Lorem.sentence, cost: 158000)#Delineador
Product.create!(name: 'Slide on pincel', description: Faker::Lorem.sentence, cost: 42000)#Delineador
Product.create!(name: 'Sourcilis Styler', description: Faker::Lorem.sentence, cost: 114000)#Cejas
Product.create!(name: 'Pattent Shine', description: Faker::Lorem.sentence, cost: 73000)#Esmalte
Product.create!(name: 'Nutrient Dense Oil', description: Faker::Lorem.sentence, cost: 234000)#Aceite
Product.create!(name: 'Virgin Luxury Oil', description: Faker::Lorem.sentence, cost: 290000)#Aceite

Category.delete_all

Category.create!(name: 'Gel', description: Faker::Lorem.sentence)
Category.create!(name: 'Tonicos', description: Faker::Lorem.sentence)
Category.create!(name: 'Polvos', description: Faker::Lorem.sentence)
Category.create!(name: 'Lipstick', description: Faker::Lorem.sentence)
Category.create!(name: 'Delineador', description: Faker::Lorem.sentence)
Category.create!(name: 'Cejas', description: Faker::Lorem.sentence)
Category.create!(name: 'Esmalte', description: Faker::Lorem.sentence)
Category.create!(name: 'Aceite', description: Faker::Lorem.sentence)

Client.delete_all

generateValues.times do |i|
	nm = Faker::Name.unique.first_name
	lastnm = Faker::Name.unique.last_name
	Client.create!(cc: Faker::Number.number(10), name: nm, lastName: lastnm, email: Faker::Internet.email, password: 'clientpwd', phone: Faker::PhoneNumber.phone_number)
end

Admin.delete_all

generateValues.times do |i|
	Admin.create!(cc: Faker::Number.number(10), name: nm, lastName: lastnm, email: Faker::Internet.email, password: 'adminpwd', phone: Faker::PhoneNumber.phone_number)
end

Store.delete_all

Store.create!(address: Faker::Address.street_address, city:'Bogota', phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, admin: 1)
Store.create!(address: Faker::Address.street_address, city:'Bogota', phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, admin: 2)
Store.create!(address: Faker::Address.street_address, city:'Bogota', phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, admin: 3)
Store.create!(address: Faker::Address.street_address, city:'Bogota', phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, admin: 4)
Store.create!(address: Faker::Address.street_address, city:'Medellin', phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, admin: 5)


Employee.delete_all

generateValues.times do |i|
	Employee.create!(cc: Faker::Number.number(10), name: nm, lastName: lastnm, email: Faker::Internet.email, password: 'adminpwd', phone: Faker::PhoneNumber.phone_number, store: Faker::Number.between(1,5))
end

Appointment.delete_all

generateValues.times do |i|
	Appointment.create!(client: Faker::Number.between(1,generateValues), employee: Faker::Number.between(1,generateValues), payment: Faker::Boolean.boolean, active: Faker::Boolean.boolean)
end

Purchase.delete_all

generateValues.times do |i|
	Purchase.create!(cost: Faker::Number.between(40000, 200000), client: Faker::Number.between(1,generateValues),product: Faker::Number.between(1,10), payment: Faker::Lorem.sentence, text: Faker::Lorem.sentence)
end
