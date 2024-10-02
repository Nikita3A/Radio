class User < ApplicationRecord
  has_secure_password
  has_many :playlists, dependent: :destroy
  enum role: { admin: 'ADMIN', user: 'USER' }

  validates :username, presence: true, uniqueness: true
  validates :role, presence: true
  validates :password, presence: true, confirmation: true, length: { minimum: 8 }, on: :create
  validates :password_confirmation, presence: true, on: :create

  before_validation :set_default_role, on: :create

  private

  def set_default_role
    self.role ||= 'USER'
  end
end
