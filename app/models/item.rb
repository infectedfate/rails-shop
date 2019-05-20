class Item < ApplicationRecord
  has_and_belongs_to_many :carts
  has_many :positions
  has_many :carts, through :positions
  has_many :images, as: :imageable
  validates :price, numericality: {greater_than: 0}
  validates :weight, numericality: {greater_than: 0}, on: :create
  validates :name, presence: true, on: :create

  afted_create :increment_category_counter
  before_destroy :decrement_category_counter

  private

  def increment_category_counter
    category.inc!(items_count)
  end

  def decrement_category_counter
    category.inc!(items_count, -1)
  end
end
