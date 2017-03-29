class CategoryCrop < ApplicationRecord
  belongs_to :category
  belongs_to :crop
end
