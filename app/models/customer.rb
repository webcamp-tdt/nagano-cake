class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def full_name
    self.first_name + " " + self.last_name
  end

  enum is_deleted: {有効: false, 退会: true}
    #有効会員はtrue、退会済み会員はfalse

    def active_for_authentication?
        super && (self.is_deleted === "Available")
    end

end
