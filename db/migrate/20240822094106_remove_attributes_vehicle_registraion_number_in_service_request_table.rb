class RemoveAttributesVehicleRegistraionNumberInServiceRequestTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :service_requests, :vehicle_registraion_number, :string
  end
end
