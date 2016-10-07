class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :content, :user_id
end
