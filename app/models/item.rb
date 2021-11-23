class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  

  attachment :image

   belongs_to :genre

  enum is_active: {販売中: true, 売切れ: false}

end
