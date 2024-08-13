class CreateVehicleBrands < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicle_brands do |t|
      t.string :vehicle_brand_name

      t.timestamps
    end
  end
end
