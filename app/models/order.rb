class Order < ApplicationRecord
  
  enum payment: { credit_card: 0, transfer: 1 }
  enum status: { wait: 0, confirm: 1, make: 2, ready: 3, complete: 4, }
  
  def delivery
      self.post_code + self.address + self.receiver
  end 


  
  has_many :order_items
  belongs_to :customer
  
  
end

