class Destination < ActiveRecord::Base

  has_many :comments, through: :reviews, dependent: :destroy
  has_many :reviews

  validates :name, presence: true,
                   length: { minimum: 4 }
  validates :country, presence: true
  validates :region, presence: true

  scope :alphabetically, -> { order("country ASC") }

  def reviews_attributes=(review_attributes)
    review_attributes.values.each do |attributes|
      if !blank_hash_values?(attributes)
        review = Review.find_or_create_by(attributes)
        self.reviews << review
      end
    end
  end
end
