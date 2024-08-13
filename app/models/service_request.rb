class ServiceRequest < ApplicationRecord

	belongs_to :user

  enum delivery_type: { drop_service: "Drop Services", pick_up: "Pick Up"}

  scope :for_current_user, ->(current_user) { where(user_id: current_user.id) }
  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end
   def self.ransackable_attributes(auth_object = nil)
    ["additional_charges", "amount", "created_at", "delivery_type", "id", "id_value", "service_by", "service_charges", "service_date", "service_description", "service_time", "status", "updated_at", "user_id", "vehicle_model", "vehicle_name", "vehicle_registraion_number", "vehicle_registration_number"]
  end
end
