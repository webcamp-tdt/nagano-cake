class OrderItem < ApplicationRecord

    belongs_to :order
    belongs_to :item
    
    enum production_status: { impossible: 0, ready: 1, make: 2, complete: 3 }
    
    def self.sumquantity
      sum(:quantity)
    end 
end
