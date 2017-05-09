class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.date :min_date
      t.date :max_date
      t.string :crop
      t.string :harvested_from
      t.string :donated_to
      t.decimal :min_quantity
      t.decimal :max_quantity

      t.timestamps
    end
  end
end
