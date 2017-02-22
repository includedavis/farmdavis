require "rails_helper"

describe User do
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
end
