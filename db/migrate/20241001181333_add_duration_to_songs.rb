class AddDurationToSongs < ActiveRecord::Migration[7.1]
  def change
    add_column :songs, :duration, :integer
  end
end
