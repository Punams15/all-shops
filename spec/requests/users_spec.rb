require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { User.create!(name: "Test", email: "test@example.com", password: "password") }

  describe "GET /edit" do
    context "when not logged in" do
      it "returns forbidden" do
        get edit_user_path(user)
        expect(response).to redirect_to(login_path)
        # OR for API-style: expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe "PATCH /update" do
    context "when not logged in" do
      it "returns forbidden" do
        patch user_path(user), params: { user: { name: "New Name" } }
        expect(response).to redirect_to(login_path)
      end
    end
  end
end
