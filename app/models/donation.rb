class Donation < ApplicationRecord
	before_save {self.crop = crop.downcase }
end
