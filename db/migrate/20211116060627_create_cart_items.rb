class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :item_id, null: false
      t.integer :customer_id, null: false
      t.integer :quantity, null: false
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
