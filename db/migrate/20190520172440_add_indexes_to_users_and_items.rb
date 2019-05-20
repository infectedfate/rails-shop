class AddIndexesToUsersAndItems < ActiveRecord::Migration[5.2]
  def change
    add_index :items, :name
    add_index :users, :email, unique: true
    add_index :images, [:imageable_id, :imageable_type]
  end
end
