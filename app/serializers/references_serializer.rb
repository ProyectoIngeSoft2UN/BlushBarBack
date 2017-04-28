class ReferencesSerializer < ActiveModel::Serializer
  attributes :id, :name, :product_id, :description
end
