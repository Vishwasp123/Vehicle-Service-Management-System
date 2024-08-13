class VehicleBrand < ApplicationRecord

	def self.ransackable_attributes(auth_object = nil)
		["created_at", "id", "id_value", "updated_at", "vehicle_brand_name"]
	end
end
