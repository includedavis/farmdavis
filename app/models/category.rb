# CATEGORY
# --------
# id, name

class Category < ApplicationRecord
	has_many :category_crops
	has_many :crops, through: :category_crops
	has_many :donations
	validates :name, uniqueness: true
	before_save {self.name = name.downcase }
end
