ActiveAdmin.register ServiceRequest do


  permit_params :user_id, :service_description, :status, :amount

  index do
    selectable_column
    id_column
    column :user
    column :vehicle_name
    column :vehicle_registration_number
    column :vehicle_model
    column :status
    column :amount
    actions
  end

  scope :all

  controller do
    def scoped_collection
      if current_user.role == 'user' # current user user show this 
        ServiceRequest.for_current_user(current_user)
      else
        super
      end
    end
  end
  

  form do |f|
    f.inputs "Service Request Details " do

      #conditon input based on user role

      # if current_user.role == 'admin'


     f.input :user_id, as: :select, collection: User.all.map { |user| [user.email, user.id] }, prompt: "Select a User"
       f.input :status, as: :select, collection: ['pending', 'completed', 'cancelled'], include_blank: false,  default: 'pending'

     # end
      f.input :vehicle_name

      vehicle_model_options = VehicleBrand.all.map{|v| [v.vehicle_brand_name, v.id]}
      vehicle_model_options << ["Other", "other" ]
      f.input :vehicle_model, as: :select, collection: vehicle_model_options ,prompt: "Select vehicle model"
      f.input :vehicle_registration_number
      f.input :service_date, as: :datepicker, input_html: { min: Date.today.strftime("%m/%d/%Y") }

      f.input :service_by, as: :select, collection: Mechanic.all.map{|m| [m.mechanic_name, m.id]} , prompt: "Select Mechanic"
      f.input :service_charges
      f.input :delivery_type, as: :select, collection: [ 'drop-service', 'pick-up', 'other' ], include_blank: false
      f.input :amount
      f.input :service_description
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
