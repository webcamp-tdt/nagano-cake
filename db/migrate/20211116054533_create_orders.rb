class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :post_code
      t.string :address
      t.string :receiver
      t.integer :postage
      t.integer :payment
      t.integer :total_payment
      t.integer :status, null: false, default: false
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
