class AddCameraToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :camera, :text
  end
end
