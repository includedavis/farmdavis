class Crop < ApplicationRecord
	has_many :category_crops
	has_many :categories, through: :category_crops
end
