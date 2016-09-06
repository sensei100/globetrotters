class Destination < ActiveRecord::Base

  has_many :comments, through: :reviews, dependent: :destroy
  has_many :reviews

  validates :name, presence: true,
                   length: { minimum: 4 }
  validates :country, presence: true
  validates :region, presence: true

  scope :alphabetically, -> { order("country ASC") }

  def reviews_attributes=(reviews_attributes)
    reviews_attributes.values.each do |review_attributes|
      self.reviews.build(review_attributes)
    end
  end
end
