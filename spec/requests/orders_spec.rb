require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let(:valid_attributes) { { total: 100.0, status: "pending" } }
  let(:updated_attributes) { { total: 150.0, status: "completed" } }

  describe "GET /index" do
    it "returns http success" do
      get "/orders"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      order = Order.create!(valid_attributes)
      get "/orders/#{order.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "creates a new order" do
      expect {
        post "/orders", params: { order: valid_attributes }
      }.to change(Order, :count).by(1)
      expect(response).to redirect_to(order_path(Order.last))
    end
  end

  describe "PATCH /update" do
    it "updates an existing order" do
      order = Order.create!(valid_attributes)
      patch "/orders/#{order.id}", params: { order: updated_attributes }
      order.reload
      expect(order.total).to eq(150.0)
      expect(order.status).to eq("completed")
      expect(response).to redirect_to(order_path(order))
    end
  end
end
