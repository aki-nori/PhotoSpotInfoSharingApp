class AddColumnsToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :latitude, :float
    add_column :places, :longitude, :float
    remove_column :places, :geocode, :string
  end
end
