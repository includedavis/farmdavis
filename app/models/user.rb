class User < ApplicationRecord
  has_secure_password   # Bcrypt validations

  validates :email, presence: true
end
