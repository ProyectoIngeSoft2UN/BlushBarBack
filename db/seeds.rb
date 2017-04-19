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
	Image.create!(path: File.open(Rails.root+'db/pictest.jpg'), description: Faker::Lorem.sentence)
end

Category.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("categories")

# [Nombre, descripcion]
category_arr = [
  ['Maquillaje','La mejores mar'],
  ['Cuidado de Piel','Tonico para el cabello'],
  ['Fragancias','Polvos faciales'],
  ['Cuidado de piel','Labiales'],
  ['Accesorios','Para los ojos'],
]

category_arr.each do |i|
  Category.create!(name: i[0], description: i[1])
end

Product.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("products")

#[Nombre, costo, category_id, image_id]
product_arr = [
  ['Galateis Douceur',137000,1,1],
  ['Pure Tonic',121000,2,1],
  ['Cocoa Powder',137000,3,2],
  ['Soft Matte Lip Cream',39000,4,2],
  ['Grandiose Liner',158000,5,3],
  ['Slide on pincel',42000,5,3],
  ['Sourcilis Styler',114000,2,4],
  ['Pattent Shine',73000,2,4],
  ['Nutrient Dense Oil',234000,3,5],
  ['Virgin Luxury Oil',290000,4,5],
]

product_arr.each do |i|
  pr = Product.create!(name: i[0], description: Faker::Lorem.sentence, cost: i[1], category_id: Category.find(i[2]).id)#Gel
  pr.images << Image.find(i[3])
end


Client.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("clients")

generateValues.times do |i|
	nm = Faker::Name.unique.first_name
	lastnm = Faker::Name.unique.last_name
	Client.create!(cc: Faker::Number.number(10), name: nm, lastName: lastnm, email: Faker::Internet.email, password: 'clientpwd', password_confirmation: 'clientpwd', phone: Faker::PhoneNumber.phone_number,address: Faker::Address.street_address,city: ['Bogota','Medellin'].sample)
end

Admin.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("admins")

admins = generateValues.times do |i|
	nm = Faker::Name.unique.first_name
	lastnm = Faker::Name.unique.last_name
	Admin.create!(cc: Faker::Number.number(10), name: nm, lastName: lastnm, email: Faker::Internet.email, password: 'adminpwd', password_confirmation: 'adminpwd', phone: Faker::PhoneNumber.phone_number)
end

Store.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("stores")

#[Ciudad, admin_id]
store_arr = [
  ['Bogota',1],
  ['Bogota',2],
  ['Bogota',3],
  ['Bogota',4],
  ['Medellin',5],
]

store_arr.each do |i|
  Store.create!(address: Faker::Address.street_address, city:i[0], phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, admin_id: Admin.find(i[1]).id)
end

Stockstore.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("stockstores")

generateValues.times do |i|
  ab = [true, false].sample
  ss = Stockstore.create!(available: ab, quantity: rand(0..20), product_id: Product.find(rand(1..10)).id, store_id: Store.find(rand(1..5)).id)
  # ss.product.create(product_id: [p1,p2,p3,p4,p5,p6,p7,p8,p9,p10].sample)
  # ss.store.create(store_id: [s1,s2,s3,s4,s5].sample)
end

Employee.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("employees")

generateValues.times do |i|
	nm = Faker::Name.unique.first_name
	lastnm = Faker::Name.unique.last_name
	em = Employee.create!(cc: Faker::Number.number(10), name: nm, lastName: lastnm, email: Faker::Internet.email, password: 'employeepwd', password_confirmation: 'employeepwd', phone: Faker::PhoneNumber.phone_number, store_id: Store.find(rand(1..5)).id)
  # em.store.create(store_id: [s1,s2,s3,s4,s5].sample)
end

Service.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("services")

services_cost_arr = [0,10000,25000]

services_arr = ['Maquillaje', 'Cuidado Piel', 'Fragancias', 'Cuidado Corporal','Accesorios']

services_arr.each do |i|
  Service.create!(name: i,description: Faker::Lorem.sentence,cost: services_cost_arr.sample)
end

Appointment.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("appointments")
generateValues.times do |i|
	pb = [true, false].sample
	ab = [true, false].sample
  employeernd = rand(1..generateValues)
  clientrnd = rand(1..generateValues)
  storernd = rand(1..5)
  servicernd = rand(1..5)
	Appointment.create!(client_id: Client.find(clientrnd).id, employee_id: Employee.find(employeernd).id, store_id: Store.find(storernd).id, service_id: Service.find(servicernd).id, active: ab, is_paid: pb, dateTime: Faker::Time.between(DateTime.now - 5, DateTime.now))
end
