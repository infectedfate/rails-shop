class DeleteTimestamps < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :created_at, :datetime
    remove_column :carts, :updated_at, :datetime
    remove_column :orders, :created_at, :datetime
    remove_column :orders, :updated_at, :datetime
  end
end
