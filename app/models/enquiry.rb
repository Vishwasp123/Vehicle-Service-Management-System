class Enquiry < ApplicationRecord
	belongs_to :user
	# validates :subject, :message, presence: true
    def self.ransackable_associations(auth_object = nil)
       ["user"]
    end
    def self.ransackable_attributes(auth_object = nil)
     ["created_at", "id", "id_value", "message", "response", "status", "subject", "updated_at", "user_id"]
    end
end
