class Shipping < ApplicationRecord
 belongs_to :customer
 def address_all
   self.postcode + self.address + self.receiver
 end
end
