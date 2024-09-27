class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :role, null: false, default: "USER"

      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
