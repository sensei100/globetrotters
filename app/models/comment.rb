class Comment < ActiveRecord::Base
  belongs_to :destination
  belongs_to :review
  belongs_to :user

  validates :content, presence: true
  
end
