class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postcode,          null: false
      t.integer :region_id,        null: false
      t.string :municipalities,    null: false
      t.string :address,           null: false
      t.string :building
      t.integer :telephone_number, null: false
      t.references :order,         null: false, foreign_key: true 
      t.timestamps
    end
  end
end
