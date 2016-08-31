class Comment < ActiveRecord::Base
  belongs_to :destination
  belongs_to :review
end
