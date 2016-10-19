class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { email.downcase! }

  validates :password,        presence: true, length: { minimum: 8 }
  validates :username,        presence: true, length: { maximum: 20 }, uniqueness: true
  validates :email,           presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }, 
                              format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  has_many :messages
end
