class Destination < ActiveRecord::Base

  has_many :comments, through: :reviews, dependent: :destroy
  has_many :reviews

  validates :name, presence: true,
                   length: { minimum: 4 }
  validates :country, presence: true
  validates :region, presence: true

  scope :alphabetically, -> { order("country ASC") }

  def reviews_attributes=(reviews_attributes)
    reviews_attributes.each do |i, review_attributes|
      review = Review.find_or_create_by(rating: review_attributes[:rating], content: review_attributes[:content])
        self.comments.build(:review => review)
      end
  end
end
