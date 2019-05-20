class AddItemsCountToCategoryTable < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :items_count, :integer
    remove_column :orders, :items_count, :integer

  end
end
