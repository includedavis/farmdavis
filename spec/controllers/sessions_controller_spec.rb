require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  describe "GET new" do
    it "should redirect if user alrady logged in" do
      user = login_user gen_user
      get :new

      expect(response).to redirect_to(user)
    end

    it "should return 200 status if user not logged in" do
      get :new

      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST create" do # login
    it "should redirect to user if login was successful" do
      user = gen_user("Test") # Generate user with password test

      post :create, params: {email: user.email, password: "Test"}
      expect(response).to redirect_to(user)
    end

    it "should set session for logged in user" do
      user = gen_user("Test") # Generate user with password test

      post :create, params: {email: user.email, password: "Test"}
      expect(session[:user_id]).to eql(user.id)
    end

    it "should redirect to login page if login was not successful" do
      user = gen_user("Test") # Generate user with password test

      post :create, params: {email: user.email, password: "Incorrect"}
      expect(response).to redirect_to(login_path)
    end
  end

  describe "DELETE destroy" do # logout
    it "should remove session token" do
      delete :destroy

      expect(session[:user_id]).to eql(nil)
    end

    it "redirect to root" do
      delete :destroy

      expect(response).to redirect_to(root_url)
    end
  end

end
