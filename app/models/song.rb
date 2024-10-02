class Song < ApplicationRecord
  belongs_to :album
  has_and_belongs_to_many :playlists
  validates :title, presence: true
  validates :lyrics, presence: true, allow_blank: true
end
