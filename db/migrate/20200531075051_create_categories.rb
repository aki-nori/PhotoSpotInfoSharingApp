class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string  :name
      t.boolean :is_delete
      t.integer :created_by

      t.timestamps
    end
  end
end
