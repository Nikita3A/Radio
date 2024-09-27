class Album < ApplicationRecord
    has_many :songs, dependent: :destroy
    validates :title, :image, :genre, presence: true
  end
  