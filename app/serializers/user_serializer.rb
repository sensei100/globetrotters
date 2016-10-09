class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :review_count

  has_many :comments, :reviews
  
  
end
