class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
  :recoverable, :rememberable, :validatable

  has_many :enquiries
  has_many :service_request

  validates :name, presence: true

  enum role: {user: 0, admin: 1}

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "id_value", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["enquiries", "service_request"]
  end
end
