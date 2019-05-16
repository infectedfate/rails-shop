class CreateCartsItems < ActiveRecord::Migration[5.2]
  def self.up
    create_table :carts_items, id: false do |t|
      t.references :cart
      t.references :item 
    end

    add_index :carts_items, [:item_id, :cart_id]
    add_index :carts_items, [:cart_id, :item_id] 
  end

  def self.down
    drop_table :carts_items
  end 
end
