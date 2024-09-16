require 'rails_helper'

RSpec.describe Admin::EnquiriesController, type: :controller do 

	include Devise::Test::ControllerHelpers


	before do
		@admin_user = User.create(email: "admin@example.com", password: "123456", role: 1, name:"Admin")
		@regular_user = User.create(email: "user@example.com", password: "123456", role: 0, name:"User")
	end

  describe "GET #index" do
    context "when the current user is an admin" do
      it "returns all enquiries" do
        get :index
        debugger
        expect(assigns(:enquiries)).to match_array(Enquiry.all)
      end
    end
  end
end