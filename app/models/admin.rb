class Admin < ApplicationRecord
  belongs_to :Store
  has_one :Image
end
