class User < ApplicationRecord
  has_secure_password   # Bcrypt validations

  validates :email, presence: true

  # User can have three roles
  # => super_admin
  # => admin
  # => standard
  #
  # => corrupt  - User has no permissions or invalid role name

  # admin?
  # ======
  #   Does the user have admin permissions
  #
  # Returns:
  #   True if user is admin or super_admin
  def admin?
    self.role == "admin" || self.role == "super_admin"
  end

  # super_admin?
  # ============
  #   Does the user have super admin permissions
  #
  # Returns:
  #   True if user is a super_admin
  def super_admin?
    self.role == "super_admin"
  end

  # standard?
  # =========
  #   Does the user have standard permissions
  #
  # Returns:
  #   True if the user is standard, admin, or super_admin
  def standard?
    self.role == "standard" || self.role == "admin" || self.role == "super_admin"
  end

  # corrupt?
  # ========
  #   Does the user have corrupt permissions
  #
  # Returns:
  #   True if user has invalid role
  def corrupt?
    !self.standard?
  end
end
