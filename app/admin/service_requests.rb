ActiveAdmin.register ServiceRequest do


  permit_params :user_id,  :service_description, :status, :amount, :vehicle_name, :vehicle_model,  :service_date, :service_time, :delivery_type, :vehicle_registration_number, :service_by, :service_charges,  :additional_charges

  index do
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
  scope :complete do |work|
    ServiceRequest.where(:status => "completed")
  end
  scope :pending do |work|
    ServiceRequest.where(:status => "pending")
  end
  scope :cancelled  do |work|
    ServiceRequest.where(:status => "cancelled")
  end





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
  f.semantic_errors # Display validation errors

  f.inputs "Service Request Details" do
    # Conditional input fields based on the user's role
    if current_user.role == 'admin'
      f.input :user_id, as: :select, collection: User.all.map { |user| [user.email, user.id] }, prompt: "Select a User"
      f.input :status, as: :select, collection: ['pending', 'completed', 'cancelled'], include_blank: false, default: 'pending'
      f.input :service_by, as: :select, collection: Mechanic.all.map { |m| [m.mechanic_name, m.id] }, prompt: "Select Mechanic"
      f.input :amount
      f.input :service_charges
    end

    # Fields common to all users
    f.input :vehicle_name
    vehicle_model_options = VehicleBrand.all.map { |v| [v.vehicle_brand_name, v.id] }
    vehicle_model_options << ["Other", "other"]
    f.input :vehicle_model, as: :select, collection: vehicle_model_options, prompt: "Select vehicle model"
    f.input :vehicle_registration_number
    f.input :service_date, as: :datepicker, input_html: { min: Date.today.strftime("%Y-%m-%d") }
    f.input :delivery_type, as: :select, collection: [['Drop Service', 'Drop Service'], ['Pick Up', 'Pick Up'], ["Other", 'Other']], include_blank: false
    f.input :service_description
  end

  f.actions # Include the standard actions (submit, cancel)
end


  show do
    attributes_table do
      # Common fields for all users
      row :user
      row :vehicle_name
      row :vehicle_model do |service|
        VehicleBrand.find_by(id: service.vehicle_model)&.vehicle_brand_name
      end
      row :service_date do |service|
        service.service_date.strftime("%B %d, %Y") if service.service_date.present?
      end
      row :delivery_type
      row :vehicle_registration_number
      row :service_description

      # Additional fields for admin users
      if current_user.role == "admin"
        row :service_by do |mechanic|
          Mechanic.find_by(id: mechanic.service_by)&.mechanic_name
        end
        row :status
        row :amount
      end
    end
  end
end
