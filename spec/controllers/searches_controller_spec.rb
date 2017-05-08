require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  describe "GET show" do
    it "should be accessible by users" do
      login_user

      get :show, params: {id: FactoryGirl.create(:Search).id}
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET new" do
    it "should be accessible by users" do
      login_user

      get :new
      expect(response).to have_http_status(:ok)
    end

    it "should redirect non users" do
      get :new
      expect(response).to redirect_to('/login')
    end
  end

  describe "POST create" do
    it "should restrict to users" do
      get :create, params: {search: FactoryGirl.attributes_for(:Search)}
      expect(response).to redirect_to('/login')
    end

    it "should allow users to create" do
      login_user
      search_count = Search.count

      get :create, params: {search: FactoryGirl.attributes_for(:Search)}
      expect(Search.count).to eql(search_count + 1)
    end
  end
end
