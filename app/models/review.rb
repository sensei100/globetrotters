class Review < ActiveRecord::Base

  belongs_to :destination
  belongs_to :user
  
  validates :content, length: { minimum: 50 },
                      presence: true
  validates :rating, presence: true

  scope :top_pick, -> { where(rating: 5) }
  
end
