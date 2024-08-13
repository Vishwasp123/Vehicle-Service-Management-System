ActiveAdmin.register VehicleCategory do

  permit_params :category_name, :description

  menu if: proc {current_user.admin?}

  index do 
    id_column
    column :category_name
    actions
  end

  
end
