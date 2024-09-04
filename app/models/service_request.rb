
class ServiceRequest < ApplicationRecord
  belongs_to :user

 validates :amount, presence: { message: "Amount can't be blank" }, if: :user_is_admin?
  validates :vehicle_name, presence: { message: "Vehicle name can't be blank" }
  validates :vehicle_model, :service_date, presence: true
  
  validates :vehicle_registration_number, presence: { message: "Vehicle registration number can't be blank" },format: { with: /\A[A-Z]{2}[ -]?[0-9]{2}[ -]?[A-Z]{1,2}[ -]?[0-9]{4}\z/,message: "Vehicle registration number format is invalid" }

  scope :for_current_user, ->(current_user) { where(user_id: current_user.id) }

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["additional_charges", "amount", "created_at", "delivery_type", "id", "id_value", "service_by", "service_charges", "service_date", "service_description", "service_time", "status", "updated_at", "user_id", "vehicle_model", "vehicle_name", "vehicle_registration_number"]
  end

  private 

  def user_is_admin?
    user&.admin?
  end
end
