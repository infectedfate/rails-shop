class Item < ApplicationRecord
  has_and_belongs_to_many :carts
  validates :price, numericality: {greater_than: 0}
  validates :weight, numericality: {greater_than: 0}, on: :create
  validates :name, presence: true, on: :create
end