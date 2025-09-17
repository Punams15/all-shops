require 'rails_helper'

RSpec.describe "Sellers", type: :request do
  let(:valid_attributes) { { name: "Test Seller", email: "seller@test.com" } }
  let(:updated_attributes) { { name: "Updated Seller", email: "updated@test.com" } }

  describe "GET /index" do
    it "returns http success" do
      get "/sellers"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      seller = Seller.create!(valid_attributes)
      get "/sellers/#{seller.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "creates a new seller" do
      expect {
        post "/sellers", params: { seller: valid_attributes }
      }.to change(Seller, :count).by(1)
      expect(response).to redirect_to(seller_path(Seller.last))
    end
  end

  describe "PATCH /update" do
    it "updates an existing seller" do
      seller = Seller.create!(valid_attributes)
      patch "/sellers/#{seller.id}", params: { seller: updated_attributes }
      seller.reload
      expect(seller.name).to eq("Updated Seller")
      expect(seller.email).to eq("updated@test.com")
      expect(response).to redirect_to(seller_path(seller))
    end
  end
end

