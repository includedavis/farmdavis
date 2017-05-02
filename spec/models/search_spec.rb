require 'rails_helper'

RSpec.describe Search, type: :model do
  it "has a valid factory" do
    expect(gen_donation).to be_valid
  end
end
