class AddCategoryRefToDonations < ActiveRecord::Migration[5.0]
  def change
  	remove_column :donations, :crop, :text
    add_reference :donations, :category, foreign_key: true
  end
end
