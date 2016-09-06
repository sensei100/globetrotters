class Review < ActiveRecord::Base

  belongs_to :destination
  belongs_to :user
  

  validates :content, length: { minimum: 50 }
  validates :rating, presence: true
  
end
