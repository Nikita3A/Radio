class AddDetailsToAlbums < ActiveRecord::Migration[7.1]
  def change
    add_column :albums, :artist, :string
    add_column :albums, :release_year, :integer
    add_column :albums, :duration, :integer
    add_column :albums, :copies, :integer
  end
end
