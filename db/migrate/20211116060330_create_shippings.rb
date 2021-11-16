class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.integer :customer_id
      t.string :receiver
      t.string :postcode
      t.string :address
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
