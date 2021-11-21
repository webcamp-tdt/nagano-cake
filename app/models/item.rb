class Item < ApplicationRecord
  has_many :cart_item, dependent: :destroy


  attachment :image


  enum is_active: {販売中: true, 売切れ: false}


end
