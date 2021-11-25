class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.integer :customer_id, null: false
      t.string :receiver, null: false
      t.string :postcode, null: false
      t.string :address, null: false
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
