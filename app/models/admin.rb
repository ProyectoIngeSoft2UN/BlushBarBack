class Admin < ApplicationRecord
	has_one :store

	validates :name,  presence: true, format: { with:/[a-z ,.'-]+/i, message: "Name must be string" }
	validates :lastName,  presence: true, format: { with: /[a-z ,.'-]+/i, message: "LastName must be string" }
	validates :email, presence: true, format: { with: /[\+A-Z0-9\._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}/i, message: "person@example.com" }
	validates :phone, presence: true,  format: { with:  /[0-9]*/, message: "Phone must be a number" }
	validates :password, presence: {message: 'Password no debe ser vacio'}
	validates :password, length: {minimum: 8, message: 'Password longitud minima de 8 '}
end
