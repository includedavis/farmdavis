class CategoryCrop < ApplicationRecord
  belongs_to :category
  belongs_to :crop
  validates :category, uniqueness: { scope: :crop}
end
