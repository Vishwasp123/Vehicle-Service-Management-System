class CreateEnquiries < ActiveRecord::Migration[7.1]
  def change
    create_table :enquiries do |t|

      t.references :user, null: false, foreign_key: true
      t.string :subject, null: false 
      t.text :message, null: false 
      t.text :response
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end
