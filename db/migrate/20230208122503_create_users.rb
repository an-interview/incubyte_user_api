class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :email, null: false, unique: true
      t.text :password, null: false

      t.timestamps
    end
  end
end
