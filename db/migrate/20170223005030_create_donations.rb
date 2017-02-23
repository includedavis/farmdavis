class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.date :date
      t.text :crop
      t.decimal :quantity

      t.timestamps
    end
  end
end
