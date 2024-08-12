class ServiceRequest < ApplicationRecord

	belongs_to :user

    scope :for_current_user, ->(current_user) { where(user_id: current_user.id) }
	def self.ransackable_attributes(auth_object = nil)
    ["amount", "created_at", "id", "id_value", "service_description", "status", "updated_at", "user_id"]
  end
   def self.ransackable_associations(auth_object = nil)
    ["user"]
  end
end
