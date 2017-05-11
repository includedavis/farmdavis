# DONATION
# --------
# DATE QUANTITY HARVESTED_FROM DONATED_TO COMMENTS CATEGORY_ID

class Donation < ApplicationRecord
	validates :date, presence: true
	validates :category_id, presence: true
	validates :quantity, presence: true
	belongs_to :category

	# The number of entries per page (pagination)
	self.per_page = 30
end
