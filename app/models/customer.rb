class Customer < ApplicationRecord
  
  has_many :shippings
  has_many :orders
  has_many :cart_items, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def full_name
    self.first_name + " " + self.last_name
  end
  
  # enum is_deleted: {available: true, invalid: false}
  
    def active_for_authentication?
        super && (self.is_deleted == false)
    end

end
