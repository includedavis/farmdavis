class ChangeHarvestedToAndDonatedByToTextAddComments < ActiveRecord::Migration[5.0]
  def change
  	add_column :donations, :comments, :text
  end
  def up
    change_column :donations, :harvested_from, :text
    change_column :donations, :donated_to, :text
  end

  def down
    change_column :donations, :harvested_from, :string
    change_column :donations, :donated_to, :string
  end
end
