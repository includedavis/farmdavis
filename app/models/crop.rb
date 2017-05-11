# CROP
# ----
# id, name

class Crop < ApplicationRecord
	has_many :category_crops
	has_many :categories, through: :category_crops
	validates :name, uniqueness: true
end
