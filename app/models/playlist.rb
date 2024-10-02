class Playlist < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :songs
  has_and_belongs_to_many :albums # If you are allowing albums too
end
