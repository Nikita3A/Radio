class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :title, null: false
      t.text :lyrics, null: false
      t.references :album, null: false, foreign_key: true

      t.timestamps
    end
  end
end
