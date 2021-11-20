class Item < ApplicationRecord
  
  enum is_active: {販売中: true, 売切れ: false}

end
