ActiveAdmin.register VehicleBrand do

 permit_params :vehicle_brand_name

 menu if: proc {current_user.admin?}

 index do 
    id_column
    column :vehicle_brand_name
    actions
 end
 
end