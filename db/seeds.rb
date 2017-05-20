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
  ['Cuidado Corporal','Labiales'],
  ['Accesorios','Para los ojos'],
]

category_arr.each do |i|
  Category.create!(name: i[0], description: i[1])
end

Subcategory.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("subcategories")

#[Nombre, descripcion,category_id]
#Muchas subcategorias son repetidas
subcategory_arr = [
  ['Cara','',1],
  ['Labios','',1],
  ['Uñas','',1],
  ['Ojos','',1],
  ['Limpiadora y Desmaquillantes','',2],
  ['Hidratantes','',2],
  ['Sueros y Tratamientos Faciales','',2],
  ['Exfoliantes y Mascarillas','',2],
  ['Tratamiento de Labios','',2],
  ['Bloqueadores Solares','',2],
  ['Contorno de Ojos','',2],
  ['Perfume de Mujeres','',3],
  ['Perfume de Hombres','',3],
  ['Fragancias para Hogar','',3],
  ['Cremas Hidratantes y Aceites','',4],
  ['Exfoliantes','',4],
  ['Cremas de Manos','',4],
  ['Desodorantes','',4],
  ['Jabones Liquidos','',4],
  ['Tratamientos','',4],
  ['Brochas y Aplicadores','',5],
  ['Cosmetiquera y Bolsas','',5],
  ['Sacapuntas','',5],
  ['Cepillos','',5],
  ['Encrespadores de Pestañas','',5],
  ['Tools de Limpieza Facial','',5],
  ['Tools Anti Celulitis','',5],
]

subcategory_arr.each do |i|
  Subcategory.create!(name: i[0], description: Faker::Lorem.sentence, category_id: Category.find(i[2]).id)
end

Product.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("products")

#[Nombre, costo, subcategory_id, image_id,brand]
product_arr = [
  ['Galateis Douceur',137000,1,1,'Bliss'],
  ['Pure Tonic',121000,2,1,'Butter London'],
  ['Cocoa Powder',137000,3,2,'Nest'],
  ['Soft Matte Lip Cream',39000,4,2,'Tocca'],
  ['Grandiose Liner',158000,5,3,'Bliss'],
  ['Slide on pincel',42000,5,3,'Bliss'],
  ['Sourcilis Styler',114000,6,4,'Giorgio Armani'],
  ['Pattent Shine',73000,7,4,'Tocca'],
  ['Nutrient Dense Oil',234000,8,5,'Nest'],
  ['Virgin Luxury Oil',290000,8,5,'Nest'],
]

product_arr.each do |i|
  pr = Product.create!(name: i[0], description: Faker::Lorem.sentence, cost: i[1], subcategory_id: Subcategory.find(i[2]).id, brand: i[4])
  pr.images << Image.find(i[3])
end

Reference.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('references')

#Name, Product_id
references_arr = [
  ['Rosa',1],
  ['Rojo',1],
  ['Durazno',2],
  ['Rojo',2],
  ['Miel',3],
  ['Rosa',3],
  ['Rojo',4],
  ['Rosa',2],
  ['Durazno',1],
]

references_arr.each do |i|
  rf = Reference.create!(name: i[0], product_id: Product.find(i[1]).id,description: Faker::Lorem.sentence)
end


Client.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("clients")

generateValues.times do |i|
	nm = Faker::Name.unique.first_name
	lastnm = Faker::Name.unique.last_name
	Client.create!(cc: Faker::Number.number(10), name: nm, lastName: lastnm, email: Faker::Internet.email, password: 'clientpwd', password_confirmation: 'clientpwd', phone: Faker::PhoneNumber.phone_number,address: Faker::Address.street_address,city: ['Bogota','Medellin'].sample, confirmed_at: Time.zone.now)
end

Admin.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("admins")

admins = generateValues.times do |i|
	nm = Faker::Name.unique.first_name
	lastnm = Faker::Name.unique.last_name
	Admin.create!(cc: Faker::Number.number(10), name: nm, lastName: lastnm, email: Faker::Internet.email, password: 'adminpwd', password_confirmation: 'adminpwd', phone: Faker::PhoneNumber.phone_number, confirmed_at: Time.zone.now)
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
	em = Employee.create!(cc: Faker::Number.number(10), name: nm, lastName: lastnm, email: Faker::Internet.email, password: 'employeepwd', password_confirmation: 'employeepwd', phone: Faker::PhoneNumber.phone_number, store_id: Store.find(rand(1..5)).id, confirmed_at: Time.zone.now)
  # em.store.create(store_id: [s1,s2,s3,s4,s5].sample)
end

Service.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("services")

services_cost_arr = [0,10000,25000]

services_arr = ['Miti miti', 'Tea Party', 'Make up Party', 'BB Brow','Quickies']

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
