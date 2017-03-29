require 'rails_helper'

RSpec.describe DonationsController, type: :controller do
  describe "GET index" do
    it "should be accessible by non users" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET show" do
    it "should be accessible by non users" do
      donation = gen_donation

      get :show, params: {id: donation}
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET new" do
    it "should be accessible by users" do
      login_user

      get :new
      expect(response).to have_http_status(:ok)
    end

    it "non users should not be redirected" do
      get :new
      expect(response).to redirect_to('/login')
    end
  end

  describe "POST create" do
    it "should restrict to users" do
      get :create, params: {donation: FactoryGirl.attributes_for(:Donation)}
      expect(response).to redirect_to('/login')
    end

    it "should allow users to create" do
      login_user
      donation_count = Donation.count

      get :create, params: {donations: [FactoryGirl.attributes_for(:Donation)]}
      expect(Donation.count).to eql(donation_count + 1)
    end

    it "should not save invalid donations" do
      login_user
      donation_count = Donation.count

      get :create, params: {donations: [FactoryGirl.attributes_for(:Donation), FactoryGirl.attributes_for(:InvalidDonation1), FactoryGirl.attributes_for(:InvalidDonation2)]}
      expect(Donation.count).to eql(donation_count + 1)
    end
  end

  describe "GET edit" do
    it "gets an existing donation" do
      expect(:get => "donations/1/edit").to route_to(
        :controller => "donations",
        :action => "edit",
        :id => "1"
      )
    end

    it "non users should not be redirected" do
      get :edit, params: {id: 1}
      expect(response).to redirect_to('/login')
    end
  end

  describe "PUT update" do
    before :each do
      @donation = FactoryGirl.create(:Donation)
    end

    it "updates an existing donation" do
      expect(:put => "donations/1").to route_to(
        :controller => "donations",
        :action => "update",
        :id => "1"
      )
    end
  end

  describe "DELETE destroy" do

    before :each do
      @donation = FactoryGirl.create(:Donation)
    end

    context "success" do

      it "deletes the donation" do
        expect{ 
          delete :destroy, params:{id: @donation}
        }.to change(Donation, :count).by(-1)
      end

    end
  end
end
