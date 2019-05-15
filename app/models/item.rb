class Item < ApplicationRecord
  validates :price, :weight, numericality: greater_then: 0, presence: true, on: :create

end
