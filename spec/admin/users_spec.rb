# spec/features/admin/users_spec.rb
require 'rails_helper'

RSpec.describe Admin::Users, type: :request do
 
  before do
    @admin = User.create(email: 'admin@example.com', name: 'Admin User', password: 'password123', password_confirmation: 'password123', role: 'admin')
    
  end

  describe "trfgyu" do 
	  it "get hgj" do 
		  get :index
		  expect(response).to have_https_status(200)

	  end
  end

end
