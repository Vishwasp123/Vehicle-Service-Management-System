class AddSomeAttributesInServiceRequests < ActiveRecord::Migration[7.1]
   def change
    add_column :service_requests, :vehicle_name, :string unless column_exists?(:service_requests, :vehicle_name)
    add_column :service_requests, :vehicle_model, :string unless column_exists?(:service_requests, :vehicle_model)
    add_column :service_requests, :vehicle_registration_number, :string unless column_exists?(:service_requests, :vehicle_registration_number)
    add_column :service_requests, :service_date, :date unless column_exists?(:service_requests, :service_date)
    add_column :service_requests, :service_time, :time unless column_exists?(:service_requests, :service_time)
    add_column :service_requests, :delivery_type, :integer unless column_exists?(:service_requests, :delivery_type)
    add_column :service_requests, :service_by ,:string
    add_column :service_requests, :service_charges, :integer
    add_column :service_requests, :additional_charges, :integer
  end
end
