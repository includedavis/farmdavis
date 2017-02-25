class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  # current_user
  # ===========
  #   Assign the current user from the session store
  #
  # Returns:
  #   @current_user - The current user can be accessed via helper_method
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # require_valid_user
  # ==================
  #   Require a valid user to access action
  def require_user
    unless current_user && current_user.standard?
      flash[:alert] = "You must be signed in to access that page."
      redirect_to '/login'
    end
  end


  # require_admin
  # =============
  #   Require a admin credential to access action
  def require_admin
    unless current_user && current_user.admin?
      flash[:alert] = "You must have admin permissions to access that page."
      redirect_to current_user # TODO: Request permissions page?
    end
  end

  # require_super_admin
  # ====================
  #   Require a super admin credential to access action
  def require_super_admin
    unless current_user && current_user.standard?
      flash[:alert] = "You must have super admin permissions to access that page."
      redirect_to current_user # TODO: Request permissions page?
    end
  end
end
