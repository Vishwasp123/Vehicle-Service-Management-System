ActiveAdmin.register User do

  menu if: proc {current_user.admin? }
  permit_params :email, :password, :password_confirmation , :name

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :role
      actions
  end

  filter :email
  filter :role
  filter :name


  scope :all
  

  form do |f|
    debugger
    f.inputs "User Details" do
      f.input :name
      f.input :email
      f.input :role
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :role
    end
  end

end
