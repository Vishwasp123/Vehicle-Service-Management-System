ActiveAdmin.register VehicleBrand do

 permit_params :vehicle_brand_name
 index do 
    id_column
    column :vehicle_brand_name
    actions
 end
end
