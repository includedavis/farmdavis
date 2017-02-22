module UserHelpers
  # gen_user
  # ========
  #   Create a new user and add to DB
  # Params:
  #   pass - Password for user (OPTIONAL)
  # Returns:
  #   New user object
  def gen_user(pass = "test")
    FactoryGirl.create(:User, password: pass, password_confirmation: pass)
  end

  # login_user
  # ==========
  #   Log a user in (Assumes password is Test unless specified)
  # Params:
  #   user - User Object (OPTIONAL - will create)
  # Returns:
  #   The user that was logged in
  def login_user(user = gen_user)
    session[:user_id] = user.id
    return user
  end

end
