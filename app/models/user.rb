class User < ApplicationRecord
  has_secure_password   # Bcrypt validations
end
