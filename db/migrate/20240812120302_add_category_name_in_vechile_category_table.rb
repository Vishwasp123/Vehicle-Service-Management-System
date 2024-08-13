class AddCategoryNameInVechileCategoryTable < ActiveRecord::Migration[7.1]
  def change
    add_column   :vehicle_categories, :category_name,  :string
    remove_column :vehicle_categories, :name , :string

  end
end
