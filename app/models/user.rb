class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  # def create_with_password(password)
  #   self.password_digest = BCrypt::Password.create(password)
  #   # ... other attributes and saving logic ...
  # end
end