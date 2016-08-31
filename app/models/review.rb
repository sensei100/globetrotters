class Review < ActiveRecord::Base

  belongs_to :destination
  has_many :comments
  
end
