class Merchant < ApplicationRecord
  belongs_to :location
  has_one :inventory, as: :owner, dependent: :destroy
  has_many :inventory_items, through: :inventory
  has_one :stock_order, as: :merchant, dependent: :destroy
  has_many :stock_rules, through: :stock_order

  def inv
    inventory
  end

  def to_s
    name
  end

  def items
    inventory.items
  end

  def price_for(item)
    stock_rules.find {|rule| rule.item == item}.price
  end

end