class AddHarvestFromAndDonatedToToDonation < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :harvested_from, :string
    add_column :donations, :donated_to, :string
  end
end
