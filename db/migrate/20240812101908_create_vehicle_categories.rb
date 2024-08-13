class CreateVehicleCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicle_categories do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
