# CROP
# ----
# id, name

class Crop < ApplicationRecord
  has_many :category_crops
  has_many :categories, through: :category_crops
  validates :name, uniqueness: true
  before_save {self.name = name.downcase }
  validate :unique_name_among_categories
	
  def unique_name_among_categories
  	errors.add(:name, "is taken by a category") if Category.where(name: name).count > 0
  end
	
end
