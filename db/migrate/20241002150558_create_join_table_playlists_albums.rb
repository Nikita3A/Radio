class CreateJoinTablePlaylistsAlbums < ActiveRecord::Migration[7.1]
  def change
    create_join_table :playlists, :albums do |t|
      # t.index [:playlist_id, :album_id]
      # t.index [:album_id, :playlist_id]
    end
  end
end
