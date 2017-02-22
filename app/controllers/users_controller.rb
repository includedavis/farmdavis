class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  # show
  # ====
  #   Show user page
  # GET /users/:id
  def show
  end

  # new
  # ===
  #   Create new user
  # GET /signup
  def new
    if current_user
      redirect_to current_user, notice: "You already logged in!"
      return
    end

    @user = User.new()
  end

  # create
  # ======
  #   Create a new user entry
  # POST /users/create
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id #log user in (Depending on client needs this may be removed)
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # TODO: Add Edit & Destroy resources

  private

  # set_user
  # ========
  #   Set the user for Action
  # Edge Case:
  #   User does not exist - Redirect to root
  def set_user
    @user = User.find_by_id(params[:id]) # Does not error if user DNE
    redirect_to root_path unless @user
  end

  # user_params
  # ===========
  #   Trusted paramaters
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
