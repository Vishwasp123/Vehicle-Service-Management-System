class Mechanic < ApplicationRecord
	 def self.ransackable_associations(auth_object = nil)
    []
  end

   def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "mechanic_address", "mechanic_contact_number", "mechanic_email", "mechanic_name", "updated_at"]
  end

end
