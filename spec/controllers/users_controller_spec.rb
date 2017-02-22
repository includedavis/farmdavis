require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "GET show" do
    it "should require a user" do
      user = gen_user

      get :show, params: {id: user.id}
      expect(response).to have_http_status(:ok)
    end

    it "should error if user does not exist" do
      get :show, params: {id: -1}
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET new" do
    it "should redirect if current user already logged in" do
      user = login_user gen_user
      get :new
      expect(response).to redirect_to(user)
    end

    it "should return a 200 status if no user currently logged in" do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST create" do # Validation test can be found in User Model Spec
    it "should create a new user if all parameters are provided" do
      user_count = User.count
      post :create, params: {user: FactoryGirl.attributes_for(:User, password: "Test",
        password_confirmation: "Test")}
      expect(User.count).to eql(user_count + 1)
    end

    it "should redirect to newly created user upon success" do
      post :create, params: {user: FactoryGirl.attributes_for(:User, password: "Test",
        password_confirmation: "Test")}
      expect(response).to redirect_to(User.order("created_at").last) # Redirect to newest user?
    end

    it "should log user in" do
      post :create, params: {user: FactoryGirl.attributes_for(:User, password: "Test",
        password_confirmation: "Test")}
      expect(session[:user_id]).to eql(User.order("created_at").last.id)
    end
  end
end
