class Donation < ApplicationRecord
	before_save {self.crop = crop.downcase } # all crop names should be lowercase
end
