class AddSingularToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :singular, :boolean, default: false
  end
end
