class AddDeletedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :deleted, :boolean, null: false, default: false
  end
end
