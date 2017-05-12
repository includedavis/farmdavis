# CATEGORYCROP
# ------------
# id, category_id, crop_id

class CategoryCrop < ApplicationRecord
  belongs_to :category
  belongs_to :crop
  validates :category, uniqueness: { scope: :crop}
end
