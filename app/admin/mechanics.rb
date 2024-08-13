ActiveAdmin.register Mechanic do

  permit_params :mechanic_name, :mechanic_contact_number, :mechanic_email, :mechanic_address

  menu if: proc {current_user.admin?}

  index do 
    selectable_column
    id_column
    column :mechanic_name
    column :mechanic_contact_number
    column :mechanic_email
    column :mechanic_address
    actions
  end

  filter :mechanic_name
  filter :mechanic_contact_number
  filter :mechanic_email
  filter :mechanic_address


  
end
