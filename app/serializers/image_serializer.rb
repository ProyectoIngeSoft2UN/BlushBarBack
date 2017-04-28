class ImageSerializer < ActiveModel::Serializer
  attributes :id, :path, :description
  has_many :products
end
