class ReviewUserSerializer < ActiveModel::Serializer
  attributes :id, :name, :review_count
  has_one :user, serializer: ReviewUserSerializer
end
