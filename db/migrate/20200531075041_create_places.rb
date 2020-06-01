class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.integer :category_id
      t.string  :geocode
      t.string  :name
      t.text    :infomation
      t.json    :images
      t.string  :address
      t.boolean :is_delete
      t.integer :created_by

      t.timestamps
    end
  end
end
