class Order < ApplicationRecord
    
  def delivery
      self.post_code + self.address + self.receiver
  end 
  
end