class Review < ActiveRecord::Base

  belongs_to :destination
  belongs_to :user
  
  validates :content, length: { minimum: 5 }
  validates :rating, presence: true,
                     inclusion: { in: [1,2,3,4,5] }

  scope :top_pick, -> { where(rating: 5) }
  
end
