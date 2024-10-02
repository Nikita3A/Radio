class Album < ApplicationRecord
  has_one_attached :image
  has_many :songs, dependent: :destroy
  has_and_belongs_to_many :playlists
  
  # Ensure these fields are present
  validates :title, presence: true
  validates :artist, presence: true
  validates :release_year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1880 }
  validates :duration, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :copies, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }


  # Allow the image to be blank, but validate when present
  validates :image, presence: true, allow_blank: true

  before_validation :set_default_duration
  
  # Set default duration to 0 before validation
  def set_default_duration
    self.duration ||= 0
  end
end
