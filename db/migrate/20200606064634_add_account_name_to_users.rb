class AddAccountNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :account_name, :string, unique: true
  end
end
