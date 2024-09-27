class User < ApplicationRecord
    has_secure_password # Adds password functionality
    validates :username, presence: true, uniqueness: true
    validates :role, presence: true, inclusion: { in: %w[ADMIN USER] }
  end
  