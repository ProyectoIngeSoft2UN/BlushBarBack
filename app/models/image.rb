class Image < ApplicationRecord
	belongs_to :Client
	belongs_to :Admin
	belongs_to :Employee
	has_and_belongs_to_many :Product

	
end
