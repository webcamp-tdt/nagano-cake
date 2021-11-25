class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :post_code, null: false
      t.string :address, null: false
      t.string :receiver, null: false
      t.integer :postage, null: false
      t.integer :payment, null: false, default: 0
      t.integer :total_payment, null: false
      t.integer :status, null: false, default: 0
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
