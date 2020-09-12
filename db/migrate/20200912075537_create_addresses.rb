class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer  :item_purchase_id,  null: false,foreign_key: true
      t.string   :postal_code,       null: false
      t.string   :muncipality,       null: false
      t.integer  :prefecture_id,     null: false
      t.string   :block_number,      null: false
      t.string   :apartment_name    
      t.integer  :phone_number,      null: false

      t.timestamps
    end
  end
end
