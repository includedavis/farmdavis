class Category < ApplicationRecord
	has_many :category_crops
	has_many :crops, through: :category_crops
end
