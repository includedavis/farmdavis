#Donation
#date crop quantity harvested_from donated_to comments

class Donation < ApplicationRecord
	validates :date, presence: true
	validates :crop, presence: true
	validates :quantity, presence: true
	before_save {self.crop = crop.downcase } # all crop names should be lowercase
end
