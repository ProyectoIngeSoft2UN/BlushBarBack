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
  ['Love Light',121000,1,1,'Too Faced'],
  ['Papa Dont Peach',121000,1,1,'Too Faced'],
  ['Sun Bunny Bronzer',121000,1,1,'Too Faced'],
  ['Skin Foundation Stick',189000,1,1,'Too Faced'],
  ['Pimed & Poreless Face Primer',121000,1,1,'Too Faced'],
  ['Fine Herbal Cleanser',157000,2,1,'Farmaesthetics'],
  ['Gel Pure Focus',100000,2,1,'Lancome'],
  ['Ultra Conditioning Lip Balm',16000,2,1,"Burt's Bees"],
  ['Beeswax Lip Balm',15000,2,1,'Burt Bees'],
  ['Pure Tonic',121000,2,1,'Butter London'],
  ['Patent Shine',73000,3,2,'Butter London'],
  ['Nail Lacquer',49000,3,2,'Butter London'],
  ['Melt Away Cuticle Exfoliator',63000,3,2,'Butter London'],
  ['Hardwear Shine UV Topcoat',63000,3,2,'Butter London'],
  ['Soft Matte Lip Cream',39000,4,2,'Tocca'],
  ['Natural Love Eye Shadow Collection',238000,4,2,'Too Faced'],
  ['Shadow Insurance Eye Shadow Primer',81000,4,2,'Too Faced'],
  ['Shadow Palette',157000,4,2,'Butter London'],
  ['Grandiose Liner',158000,4,2,'Lancome'],
  ['Makeup Remover Glove',39000,4,2,'Blush Bar'],
  ['Pure Complexion Tonic',121000,5,3,'Farmaesthetics'],
  ['Fabulous Foaming Face Wash',36000,5,3,'Bliss'],
  ['Tonique Confort',115000,5,3,'Lancome'],
  ['Eau Micellaire Douceur',150000,5,3,'Lancome'],
  ['Juju Bar',113000,5,3,'Drunk Elephant'],
  ['Facial Cleansing Towelettes With White Tea Extract',29000,5,3,"Burt's Bees"],
  ['Nourishing Lavender Milk',157000,6,3,'Farmaesthetics'],
  ['Hydra Zen SPF 15',225000,6,3,'Lancome'],
  ['Absolue Nuit Premium ßx',844000,6,3,'Lancome'],
  ['Triple Oxygen Ex-Glow-Sion Moisture Cream',258000,6,3,'Bliss'],
  ['Nutrient Dense Fine Facial Oil',234000,7,4,'Farmaesthetics'],
  ['Visionnaire Lumineuse',327000,7,4,'Lancome'],
  ['Génifique Créme',378000,7,4,'Lancome'],
  ['Virgin Marula Luxury Facial Oil',290000,7,4,'Drunk Elephant'],
  ['Buffing Grains for Face',174000,8,5,'Bobbi Brown'],
  ['Vassar Rose Perfecting Polish',121000,8,5,'Farmaesthetics'],
  ["That'S Incredi-'Peel'! Glycolic Resurfacing Pads",197000,8,5,'Bliss'],
  ['Umbra Sheer Physical Defense SPF 30',153000,10,5,'Drunk Elephant'],
  ['Genifique Eye Pearl',343000,11,5,'Lancome'],
  ['White Sandalwood Eau de Parfum',101000,12,5,'NEST Fragances'],
  ['Paradise Eau de Parfum',101000,12,5,'NEST Fragances'],
  ['Simone Eau de Parfum',274000,12,5,'Tocca'],
  ['Isabel Eau de Parfum',274000,12,5,'Tocca'],
  ['Tresor Midnight Rose Eau de Parfum',315000,12,5,'Lancome'],
  ['Si Eau de Toilette',390000,12,5,'Giorgio Armani'],
  ['Emporio Armani Elle',324000,12,5,'Giorgio Armani'],
  ['Acqua Di Giò Profumo',511000,13,5,'Giorgio Armani'],
  ['Acqua Di Giò Homme Essenza',392000,13,5,'Giorgio Armani'],
  ['Emporio Armani Il',318000,13,5,'Giorgio Armani'],
  ['Armani Code Ice',405000,13,5,'Giorgio Armani'],
  ['Vanilla Orchid & Almond Classic Candle',154000,14,5,'NEST Fragances'],
  ['Orange Blossom Classic Candle',154000,14,5,'NEST Fragances'],
  ['Grapefruit Classic Candle',154000,14,5,'NEST Fragances'],
  ['Tocca Beauty Candele Da Viaggio',171000,14,5,'Tocca'],
  ['Stella Candela',129000,14,5,'Tocca'],
  ['Lemon Sage Body Butter',117000,15,5,'Bliss'],
  ['Honey & Shea Body Butter',46000,15,5,"Burt's Bees"],
  ['Vanilla Bergamot Body Butter',117000,15,5,'Bliss'],
  ['Lemon Sage Body Scrub',145000,15,5,'Bliss'],
  ['Hot Salt Scrub',153000,16,5,'Bliss'],
  ['Blood Orange White Pepper Sugar Scrub',145000,16,5,'Bliss'],
  ['Stella Crema Da Mano',40000,17,5,'Tocca'],
  ['Giulietta Crema Da Mano',40000,17,5,'Tocca'],
  ['Almond & Milk Hand Cream',37000,17,5,"Burt's Bees"],
  ['Lemon Sage Soapy Suds',73000,19,5,'Bliss'],
  ['Grapefruit Aloe Soapy Suds',73000,19,5,'Bliss'],
  ['Blood Orange White Pepper Soapy Suds',73000,19,5,'Bliss'],
  ['Softening Socks',200000,20,5,'Bliss'],
  ['Glamour Gloves',200000,20,5,'Bliss'],
  ['Fat Girl Six Tummy Toning Gel',153000,20,5,'Bliss'],
  ['Blending Sponge',34000,21,5,'Blush Bar'],
  ['Brush Egg Cleaner',39000,21,5,'Blush Bar'],
  ['Konjac Sponge',42000,21,5,'Blush Bar'],
  ['Brocha Precise Eye Liner',46000,21,5,'Blush Bar'],
  ['Brocha Airbrush Foundation',79000,21,5,'Blush Bar'],
  ['Brocha Kabuki Con Estuche',83000,21,5,'Blush Bar'],
  ['Retractable Kabuki Brush',137000,21,5,'Too Faced'],
  ['Makeup Bag Go Blush Yourself',39000,22,5,'Blush Bar'],
  ['Makeup Bag Cinderella',39000,22,5,'Blush Bar'],
  ['Makeup Bag Beauty Begins',39000,22,5,'Blush Bar'],
  ['Bolsa De Maquillaje',22000,22,5,'Blush Bar'],
  ['Tajalapiz',21000,23,5,'NYX'],
  ['Cepillo de Pelo Pequeño',25000,24,5,'Blush Bar'],
  ['Encrespador De Pestañas',32000,25,5,'Blush Bar'],
  ['Fat Girl Slim Slimulator',89000,27,5,'Blush Bar'],
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
