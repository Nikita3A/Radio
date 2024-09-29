class Album < ApplicationRecord
  has_many :songs, dependent: :destroy
  
  validates :title, :artist, :release_year, :duration, :copies, presence: true
  validates :release_year, numericality: { only_integer: true, greater_than_or_equal_to: 1880 }
  validates :copies, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Додаткові поля
  attribute :duration, :integer # Тривалість у секундах або хвилинах
  attribute :copies, :integer   # Кількість екземплярів
end
