# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

generateValues = 5
Image.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("image")

generateValues.times do |i|
	Image.create!(name: Faker::File.file_name('image',), description: Faker::Lorem.sentence)
end

Product.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("products")

Product.create!(name: 'Galateis Douceur', description: Faker::Lorem.sentence, cost: 137000, quantity: Faker::Number.between(0,50),available: true)#Gel
Product.create!(name: 'Pure Tonic', description: Faker::Lorem.sentence, cost: 121000, quantity: Faker::Number.between(0,50),available: true)#Tonicos
Product.create!(name: 'Cocoa Powder', description: Faker::Lorem.sentence, cost: 137000, quantity: Faker::Number.between(0,50),available: true)#Polvos
Product.create!(name: 'Soft Matte Lip Cream', description: Faker::Lorem.sentence, cost: 39000, quantity: Faker::Number.between(0,50),available: true)#Lipstick
Product.create!(name: 'Grandiose Liner', description: Faker::Lorem.sentence, cost: 158000, quantity: Faker::Number.between(0,50),available: true)#Delineador
Product.create!(name: 'Slide on pincel', description: Faker::Lorem.sentence, cost: 42000, quantity: Faker::Number.between(0,50),available: true)#Delineador
Product.create!(name: 'Sourcilis Styler', description: Faker::Lorem.sentence, cost: 114000, quantity: Faker::Number.between(0,50),available: true)#Cejas
Product.create!(name: 'Pattent Shine', description: Faker::Lorem.sentence, cost: 73000, quantity: Faker::Number.between(0,50),available: true)#Esmalte
Product.create!(name: 'Nutrient Dense Oil', description: Faker::Lorem.sentence, cost: 234000, quantity: Faker::Number.between(0,50),available: true)#Aceite
Product.create!(name: 'Virgin Luxury Oil', description: Faker::Lorem.sentence, cost: 290000, quantity: Faker::Number.between(0,50),available: true)#Aceite

Category.destroy_all

Category.create!(name: 'Gel', description: Faker::Lorem.sentence)
Category.create!(name: 'Tonicos', description: Faker::Lorem.sentence)
Category.create!(name: 'Polvos', description: Faker::Lorem.sentence)
Category.create!(name: 'Lipstick', description: Faker::Lorem.sentence)
Category.create!(name: 'Delineador', description: Faker::Lorem.sentence)
Category.create!(name: 'Cejas', description: Faker::Lorem.sentence)
Category.create!(name: 'Esmalte', description: Faker::Lorem.sentence)
Category.create!(name: 'Aceite', description: Faker::Lorem.sentence)

Client.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("clients")

generateValues.times do |i|
	nm = Faker::Name.unique.first_name
	lastnm = Faker::Name.unique.last_name
	Client.create!(cc: Faker::Number.number(10), name: nm, lastName: lastnm, email: Faker::Internet.email, password: 'clientpwd', phone: Faker::PhoneNumber.phone_number)
end

Admin.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("admins")

generateValues.times do |i|
	nm = Faker::Name.unique.first_name
	lastnm = Faker::Name.unique.last_name
	Admin.create!(cc: Faker::Number.number(10), name: nm, lastName: lastnm, email: Faker::Internet.email, password: 'adminpwd', phone: Faker::PhoneNumber.phone_number)
end

Store.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("stores")

Store.create!(address: Faker::Address.street_address, city:'Bogota', phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, admin: Admin.find(1))
Store.create!(address: Faker::Address.street_address, city:'Bogota', phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, admin: Admin.find(2))
Store.create!(address: Faker::Address.street_address, city:'Bogota', phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, admin: Admin.find(3))
Store.create!(address: Faker::Address.street_address, city:'Bogota', phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, admin: Admin.find(4))
Store.create!(address: Faker::Address.street_address, city:'Medellin', phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, admin: Admin.find(5))


Employee.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("employees")

generateValues.times do |i|
	nm = Faker::Name.unique.first_name
	lastnm = Faker::Name.unique.last_name
	Employee.create!(cc: Faker::Number.number(10), name: nm, lastName: lastnm, email: Faker::Internet.email, password: 'adminpwd', phone: Faker::PhoneNumber.phone_number, store: Store.find(Faker::Number.between(1,5)))
end

Appointment.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("appointments")
generateValues.times do |i|
	pb = [true, false].sample
	ab = [true, false].sample
	Appointment.create!(client: Client.find(Faker::Number.between(1,generateValues)), employee: Employee.find(Faker::Number.between(1,generateValues)), payment: pb, active: ab)
end

Purchase.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("purchases")

generateValues.times do |i|
	Purchase.create!(cost: Faker::Number.between(40000, 200000), client: Client.find(Faker::Number.between(1,generateValues)),product: Product.find(Faker::Number.between(1,10)), payment: Faker::Lorem.sentence, description: Faker::Lorem.sentence)
end
