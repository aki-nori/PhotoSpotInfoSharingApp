class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :title
      t.integer :user_id
      t.integer :place_id
      t.string  :title
      t.json    :images
      t.date    :date
      t.time    :time
      t.integer :rate
      t.string  :access
      t.text    :notify
      t.text    :comment
      t.string  :url
      t.boolean :is_delete, null: false, default: false
      t.integer :created_by

      t.timestamps
    end
  end
end
