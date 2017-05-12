class CreateCategoryCrops < ActiveRecord::Migration[5.0]
  def change
    create_table :category_crops do |t|
      t.references :category, foreign_key: true
      t.references :crop, foreign_key: true

      t.timestamps
    end
  end
end
