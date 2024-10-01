class Song < ApplicationRecord
  belongs_to :album
  validates :title, presence: true
  validates :lyrics, presence: true, allow_blank: true
end
