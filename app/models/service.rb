class Service < ApplicationRecord
	has_many :appointments

	validates :name, :description, presence: true
end
