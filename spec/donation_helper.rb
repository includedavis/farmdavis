module DonationHelpers
  # gen_donation
  # ============
  #   Create a new donation and add to DB
  # Returns:
  #   New user object
  def gen_donation()
    FactoryGirl.create(:Donation)
  end
end
