class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.integer :quantity, null: false
      t.integer :price_intax, null: false
      t.integer :production_status, null: false, default: 0
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
