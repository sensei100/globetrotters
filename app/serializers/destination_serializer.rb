class DestinationSerializer < ActiveModel::Serializer
  attributes :id, :name, :region, :country

  has_many :reviews
end
