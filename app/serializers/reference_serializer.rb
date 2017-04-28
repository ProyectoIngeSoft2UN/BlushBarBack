class ReferenceSerializer < ActiveModel::Serializer
  attributes :id, :name, :product_id, :description
  belongs_to :product
end
