class CreateServiceRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :service_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.text :service_description
      t.text :status
      t.integer :amount

      t.timestamps
    end
  end
end
