# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

generateValues = 10
Image.delete_all

generateValues.times do |i|
	Image.create!()
end

Product.delete_all

generateValues.times do |i|
	Product.create!()
end

Category.delete_all

generateValues.times do |i|
	Category.create!()
end

Client.delete_all

generateValues.times do |i|
	Client.create!()
end

Admin.delete_all

generateValues.times do |i|
	Admin.create!()
end

Store.delete_all

generateValues.times do |i|
	Store.create!()
end

Employee.delete_all

generateValues.times do |i|
	Employee.create!()
end

Appointment.delete_all

generateValues.times do |i|
	Appointment.create!()
end

Purchase.delete_all

generateValues.times do |i|
	Purchase.create!()
end
