require "rails_helper"

describe User, type: :model do
  it "has a valid factory" do
    expect(gen_user).to be_valid
  end

  it "requires email" do
    expect(FactoryGirl.build(:User, email: nil,
      password: "Test")).not_to be_valid
  end

  it "requires email to be unique" do
    userA = FactoryGirl.create(:User, email: "test@test.com",
      password: "Test")
    userB = FactoryGirl.build(:User, email: "test@test.com")

    expect(userB).not_to be_valid
  end

  describe ".admin?" do

    context "when user has admin role" do
      it "should return true" do
        expect(gen_roled_user("admin").admin?).to eql(true)
      end
    end

    context "when user has standard role" do
      it "should return false" do
        expect(gen_roled_user("standard").admin?).to eql(false)
      end
    end

    context "when user has super_admin role" do
      it "should return true" do
        expect(gen_roled_user("super_admin").admin?).to eql(true)
      end
    end

    context "when user has invalid role" do
      it "should return false" do
        # invalid - "ADMIN" must be "admin"
        expect(gen_roled_user("ADMIN").admin?).to eql(false)
      end
    end

  end
end
