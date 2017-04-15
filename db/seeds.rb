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

c1 = Category.create!(name: 'Gel', description: 'Gel para maquillaje')
c2 = Category.create!(name: 'Tonicos', description: 'Tonico para el cabello')
c3 = Category.create!(name: 'Polvos', description: 'Polvos faciales')
c4 = Category.create!(name: 'Lipstick', description: 'Labiales')
c5 = Category.create!(name: 'Delineador', description: 'Para los ojos')
c6 = Category.create!(name: 'Cejas', description: 'Articulos para las cejas')
c7 = Category.create!(name: 'Esmalte', description: 'Diferentes colores para uñas')
c8 = Category.create!(name: 'Aceite', description: 'Faciales')

Product.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("products")

p1 = Product.create!(name: 'Galateis Douceur', description: Faker::Lorem.sentence, cost: 137000, category_id: Category.find(1).id)#Gel
p1.images << Image.find(1)
p2 = Product.create!(name: 'Pure Tonic', description: Faker::Lorem.sentence, cost: 121000, category_id: Category.find(2).id)#Tonicos
p2.images << Image.find(1)
p3 = Product.create!(name: 'Cocoa Powder', description: Faker::Lorem.sentence, cost: 137000, category_id: Category.find(3).id)#Polvos
p3.images << Image.find(2)
p4 = Product.create!(name: 'Soft Matte Lip Cream', description: Faker::Lorem.sentence, cost: 39000, category_id: Category.find(4).id)#Lipstick
p4.images << Image.find(2)
p5 = Product.create!(name: 'Grandiose Liner', description: Faker::Lorem.sentence, cost: 158000, category_id: Category.find(5).id)#Delineador
p5.images << Image.find(3)
p6 = Product.create!(name: 'Slide on pincel', description: Faker::Lorem.sentence, cost: 42000, category_id: Category.find(5).id)#Delineador
p6.images << Image.find(3)
p7 = Product.create!(name: 'Sourcilis Styler', description: Faker::Lorem.sentence, cost: 114000, category_id: Category.find(6).id)#Cejas
p7.images << Image.find(4)
p8 = Product.create!(name: 'Pattent Shine', description: Faker::Lorem.sentence, cost: 73000, category_id: Category.find(7).id)#Esmalte
p8.images << Image.find(4)
p9 = Product.create!(name: 'Nutrient Dense Oil', description: Faker::Lorem.sentence, cost: 234000, category_id: Category.find(8).id)#Aceite
p9.images << Image.find(5)
p10 = Product.create!(name: 'Virgin Luxury Oil', description: Faker::Lorem.sentence, cost: 290000, category_id: Category.find(8).id)#Aceite
p10.images << Image.find(5)



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

# Store.create!(address: Faker::Address.street_address, city:'Bogota', phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, admin: Admin.find(1))
s1 = Store.create!(address: Faker::Address.street_address, city:'Bogota', phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, admin_id: Admin.find(1).id)
s2 = Store.create!(address: Faker::Address.street_address, city:'Bogota', phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, admin_id: Admin.find(2).id)
s3 = Store.create!(address: Faker::Address.street_address, city:'Bogota', phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, admin_id: Admin.find(3).id)
s4 = Store.create!(address: Faker::Address.street_address, city:'Bogota', phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, admin_id: Admin.find(4).id)
s5 = Store.create!(address: Faker::Address.street_address, city:'Medellin', phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, admin_id: Admin.find(5).id)

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

sv1 = Service.create!(name: 'Limpieza',description: Faker::Lorem.sentence,cost: [0,10000,25000].sample)
sv2 = Service.create!(name: 'Uñas',description: Faker::Lorem.sentence,cost: [0,10000,25000].sample)
sv3 = Service.create!(name: 'Cejas',description: Faker::Lorem.sentence,cost: [0,10000,25000].sample)
sv4 = Service.create!(name: 'Nocturna',description: Faker::Lorem.sentence,cost: [0,10000,25000].sample)
sv5 = Service.create!(name: 'Natural',description: Faker::Lorem.sentence,cost: [0,10000,25000].sample)

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
