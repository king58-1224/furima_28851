class CreateFurimas < ActiveRecord::Migration[6.0]
  def change
    create_table :furimas do |t|
      t.string        :title        , null: false
      t.string        :text         , null: false
      t.string        :genre_id     , null: false
      t.timestamps
    end
  end
end
