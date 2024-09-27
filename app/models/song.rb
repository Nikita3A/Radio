class Song < ApplicationRecord
  belongs_to :album
  validates :title, :lyrics, presence: true
end
