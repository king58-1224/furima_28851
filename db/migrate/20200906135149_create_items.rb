class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,          null: false
      t.integer :price,         null: false
      t.text    :description,   null: false
      t.integer :condition,     null: false
      t.integer :shipping_cost, null: false
      t.integer :shipping_days, null: false
      t.integer :shipping_from, null: false
      t.integer :category_id,   null: false
      t.integer :user_id,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
