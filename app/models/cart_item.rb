class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  def sum_of_price
    # cart_items.item.price * 1.1.round * cart_items.quantity
    # item.taxin_price * quantity
  end
end
