ActiveAdmin.register ServiceRequest do


  permit_params :user_id, :service_description, :status, :amount

  index do
    selectable_column
    id_column
    column :user
    column :service_description
    column :status
    column :amount
    actions
  end

  scope :all

   controller do
    def scoped_collection
      if current_user.role == 'user' # Replace 'role' with the actual role you want to check
        ServiceRequest.for_current_user(current_user)
      else
        super
      end
    end
  end
  

  form do |f|
    f.inputs "Service Request Details" do
      f.input :user, as: :select, collection: User.all.map { |u| [u.email, u.id] }, prompt: "Select a User"
      f.input :service_description
      f.input :status, as: :select, collection: ['pending', 'completed', 'cancelled'], include_blank: false,  default: 'pending'
      f.input :amount
    end
    f.actions
  end

  show do
    attributes_table do
      row :user
      row :service_description
      row :status
      row :amount
    end
  end
end
