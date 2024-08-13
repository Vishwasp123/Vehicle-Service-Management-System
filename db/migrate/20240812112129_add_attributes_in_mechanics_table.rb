class AddAttributesInMechanicsTable < ActiveRecord::Migration[7.1]
  def change
    add_column :mechanics, :mechanic_name, :string
    add_column :mechanics, :mechanic_contact_number, :string
    add_column :mechanics, :mechanic_email, :string  
    add_column :mechanics, :mechanic_address, :string
    
    # Remove the column from the correct table
    remove_column  :mechanics, :details ,:text
     remove_column  :mechanics, :name ,:text
  end
end
