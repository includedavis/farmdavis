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

    if crop.present?
      donations = donations
                  .joins(category: :crops)
                  .joins(<<-SQL)
                    LEFT JOIN (
                      SELECT ca2.name as parent_category_name, ca3.id as child_category_id
                      FROM category_crops cc2
                      JOIN categories ca2 ON ca2.id = cc2.category_id
                      JOIN crops cr2 ON cr2.id = cc2.crop_id
                      JOIN categories ca3 ON ca3.name = cr2.name
                    ) cp ON cp.child_category_id = categories.id
                  SQL
                  .where('categories.name LIKE :term OR crops.name LIKE :term OR cp.parent_category_name LIKE :term', term: "%#{crop}%").distinct
#                  .left_outerjoins(category: { category_crops: :crop })
#                  .where("categories.name LIKE :term OR crops.name LIKE :term", term: "%#{crop}%").distinct
    end

    return donations
  end
end
