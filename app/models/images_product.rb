class ImagesProduct < ApplicationRecord
  belongs_to :Image
  belongs_to :Product
end
