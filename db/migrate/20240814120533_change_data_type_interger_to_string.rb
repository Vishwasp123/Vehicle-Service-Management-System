class ChangeDataTypeIntergerToString < ActiveRecord::Migration[7.1]
  def change
    change_column :service_requests, :delivery_type, :string
  end
end
