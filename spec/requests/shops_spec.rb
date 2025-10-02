require 'rails_helper'

RSpec.describe "Shops", type: :request do
  let(:user) { User.create!(name: "Seller", email: "seller@example.com", password: "password") }

  describe "GET /new" do
    context "when not logged in" do
      it "redirects to login" do
        get new_shop_path
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe "POST /create" do
    context "when not logged in" do
      it "does not allow creating a shop" do
        post shops_path, params: { shop: { name: "Test Shop" } }
        expect(response).to redirect_to(login_path)
      end
    end
  end
end