class Shipping < ApplicationRecord
    
  belongs_to :customer
def address_all
    self.postcode + self.receiver + self.address
end 
end
