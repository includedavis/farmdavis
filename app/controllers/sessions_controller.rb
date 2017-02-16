class SessionsController < ApplicationController
  # new
  # ===
  #   Login page
  # GET /login
  def new
  end

  # create
  # ======
  #   Create new session and assign current_user
  # POST /sessions/create
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      puts "logging in user: " + user.id.to_s
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
    redirect_to root_url, notice: "User logged out."
  end
end
