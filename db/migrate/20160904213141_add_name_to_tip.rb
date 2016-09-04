class AddNameToTip < ActiveRecord::Migration
  def change
    add_column :tips, :name, :string
  end
end
