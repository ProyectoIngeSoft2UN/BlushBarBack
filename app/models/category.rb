class Category < ApplicationRecord
	has_and_belongs_to_many :Products

	def get_categories
		include(:name,:description)
	end
end
