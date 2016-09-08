class Comment < ActiveRecord::Base
  belongs_to :destination
  belongs_to :user
  belongs_to :review

  validates :content, presence: true

  def self.recent_comments
    order('created_at DESC').limit(10)
  end

end
