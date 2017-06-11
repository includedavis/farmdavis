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
#    donations = donations.where("crop like ?", "%#{crop}%") if crop.present?
    donations = donations.where("date >= ?", min_date).references(:donations) if min_date.present?
    donations = donations.where("date <= ?", max_date).references(:donations) if max_date.present?
    donations = donations.where("quantity >= ?", min_quantity).references(:donations) if min_quantity.present?
    donations = donations.where("quantity <= ?", max_quantity).references(:donations) if max_quantity.present?
    donations = donations.where("harvested_from like ?", "%#{harvested_from}%").references(:donations) if harvested_from.present?
    donations = donations.where("donated_to like ?", "%#{donated_to}%").references(:donations) if donated_to.present?
    donations = donations.joins(:category).includes(:category)
    donations = donations.where("name like ?", "%#{crop}%").references(:categories) if crop.present?
    return donations
  end
end
