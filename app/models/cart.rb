class Cart < ApplicationRecord
  has_many :positions
  belongs_to :user
  has_and_belongs_to_many :items
  validates :user, presence: true
  validates :user_id, uniqueness: true

  def add_item(item)
    if items.include?(item)
      positions.where(item_id: item.id).first.increment!(:quantity)
    else
      positions.create(item: item, quantity: 1)
    end
  end

  def remove_item(item)
    if items.include?(item)
      positions.where(item_id: item.id).first.decrement!(:quantity) if quantity.lenght > 0
    elsif position.quantity == 0
      position.destroy
    end
  end

  def remove_position(position_to_remove_id)
    position.where(item_id: position_to_remove_id).first.try(:destroy)
  end
end
