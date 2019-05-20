class Item < ApplicationRecord
  has_and_belongs_to_many :carts
  has_many :positions
  has_many :carts, through: :positions
  has_many :images, as: :imageable
  validates :price, numericality: {greater_than: 0}
  validates :weight, numericality: {greater_than: 0}, on: :create
  validates :name, presence: true, on: :create

  after_create do
    category.inc!(items_count)
  end

  before_destroy do
    category.inc!(items_count, -1)
end
end
