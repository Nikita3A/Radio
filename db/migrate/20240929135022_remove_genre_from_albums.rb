class RemoveGenreFromAlbums < ActiveRecord::Migration[7.1]
  def change
    remove_column :albums, :genre, :string
  end
end
