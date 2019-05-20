class AddUserColumnToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :used, :boolean, default: false
  end
end
