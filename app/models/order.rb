class Order < ApplicationRecord
 belongs_to :customer
	has_many :order_items
  def delivery
      self.post_code + self.address + self.receiver
  end
  enum status: {クレジットカード:0, 銀行振込:1}
end
