class Search < ApplicationRecord
  # donations
  # =========
  #   Public interface to find_donations method
  def donations
    @donations = find_donations
  end

private

  # find_donations
  # ==============
  #   Using the query stated in the search record, narrow down the donation list
  # Returns:
  #   The refined query
  def find_donations
    donations = Donation.all.order("date DESC")
    donations = donations.where("crop like ?", "%#{crop}%") if crop.present?
    donations = donations.where("date >= ?", min_date) if min_date.present?
    donations = donations.where("date <= ?", max_date) if max_date.present?
    donations = donations.where("quantity >= ?", min_quantity) if min_quantity.present?
    donations = donations.where("quantity <= ?", max_quantity) if max_quantity.present?
    donations = donations.where("harvested_from like ?", "%#{harvested_from}%") if harvested_from.present?
    donations = donations.where("donated_to like ?", "%#{donated_to}%") if donated_to.present?
    return donations
  end
end
