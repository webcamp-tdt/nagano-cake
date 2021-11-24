class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.string :image_id, null: false
      t.boolean :is_active, default: false
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
