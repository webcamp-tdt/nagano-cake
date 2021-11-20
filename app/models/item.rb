class Item < ApplicationRecord


  attachment :image

  
  enum is_active: {販売中: true, 売切れ: false}


end
