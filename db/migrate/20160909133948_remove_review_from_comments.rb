class RemoveReviewFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :review_id, :integer
  end
end
