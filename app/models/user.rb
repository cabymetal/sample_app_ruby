class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save { self.email = email.downcase }
  validates(:name, presence: true, length: { maximum: 30 })
  validates(:email, presence: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false })
  validates(:file_url, presence: true)
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
