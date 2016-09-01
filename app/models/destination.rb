class Destination < ActiveRecord::Base

  has_many :comments, through: :reviews, dependent: :destroy
  has_many :reviews

  validates :name, presence: true,
                     length: { minimum: 4 }

  scope :alphabetically, -> { order("country ASC") }
end
