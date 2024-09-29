class User < ApplicationRecord
    has_secure_password # Adds password functionality
    validates :username, presence: true, uniqueness: true
    validates :role, presence: true, inclusion: { in: %w[ADMIN USER] }
    validates :password, presence: true, confirmation: true
    validates :password_confirmation, presence: true
  end
  