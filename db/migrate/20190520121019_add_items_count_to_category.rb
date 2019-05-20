class AddItemsCountToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :items_count, :integer
  end
end
