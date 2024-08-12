ActiveAdmin.register Enquiry do
  permit_params :user_id, :subject, :message, :response, :status

  index do 
    selectable_column
    id_column
    column :user
    column :subject
    column :message
    column :response
    column :status
    actions
  end

  scope :all
  scope :pending, :default => true do |status|
    status.where(:status => 'pending')
   end
    scope :approve, :default => true do |status|
    status.where(:status => 'resolved')
   end
  form do |f|
  f.inputs "Enquiry Details" do
    # Conditional input based on user role
    if current_user.role == 'admin'
      f.input :user_id, as: :select, collection: User.all.map { |user| [user.email, user.id] }, prompt: "Select a User"
      f.input :response
      f.input :status, as: :select, collection: ['pending', 'resolved']
    else
      f.input :user_id, as: :select, collection: [[current_user.email, current_user.id]], include_blank: false, input_html: { disabled: true, value: current_user.id }
      f.input :status, as: :select, collection: ['pending', 'resolved'] , input_html: {disabled: true}
    end
    f.input :subject
    f.input :message
  end
  f.actions
end


  show do 
    attributes_table do
      row :user
      row :subject
      row :message
      row :response
      row :status
    end
  end

end
