class Destination < ActiveRecord::Base

  has_many :comments
  
  validates :name, presence: true,
                     length: { minimum: 4 }
end
