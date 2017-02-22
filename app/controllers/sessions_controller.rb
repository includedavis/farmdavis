class SessionsController < ApplicationController
  # new
  # ===
  #   Login page
  # GET /login
  def new
    if current_user
      redirect_to current_user, notice: "You already logged in!"
    end
  end

  # create
  # ======
  #   Create new session and assign current_user
  # POST /sessions/create
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to current_user, notice: "You're in!"
    else
      redirect_to '/login', alert: "User not logged in"
    end
  end

  # destroy
  # =======
  #   Destroy session (logout)
  # DELETE /logout
  def destroy
    reset_session
    redirect_to root_url, notice: "User logged out."
  end
end
