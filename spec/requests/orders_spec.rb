require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let(:user) { User.create!(name: "Buyer", email: "buyer@example.com", password: "password") }

  describe "GET /new" do
    context "when not logged in" do
      it "redirects to login" do
        get new_order_path
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe "POST /create" do
    context "when not logged in" do
      it "does not allow creating an order" do
        post orders_path, params: { order: { total: 100 } }
        expect(response).to redirect_to(login_path)
      end
    end
  end
end
