class VehicleCategory < ApplicationRecord

	validates :category_name, presence: true, uniqueness: true
 def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "id_value", "category_name", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    []
  end
end
