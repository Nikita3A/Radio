class ChangeImageToAllowNullInAlbums < ActiveRecord::Migration[6.0]
  def change
    change_column_null :albums, :image, true
  end
end
