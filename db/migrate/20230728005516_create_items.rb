class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name,            null: false
      t.text :description_item,       null: false
      t.integer :category_id,         null: false
      t.integer :condition_id,        null: false
      t.integer :shipping_charges_id, null: false
      t.integer :region_id,           null: false
      t.integer :number_of_day_id,    null: false
      t.string :price ,               null: false
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
