class AddReviewCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :review_count, :integer, default: 0
  end
end
