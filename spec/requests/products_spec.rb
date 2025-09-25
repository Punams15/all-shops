require 'rails_helper'

RSpec.describe "Products", type: :request do
  let(:valid_attributes) do
    { name: "Test Product", price: 19.99, description: "Test description" }
  end

  let(:updated_attributes) do
    { name: "Updated Product", price: 29.99, description: "Updated description" }
  end

  describe "GET /index" do
    it "returns http success" do
      get "/products"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      product = Product.create!(valid_attributes)
      get "/products/#{product.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "creates a new product" do
      expect {
        post "/products", params: { product: valid_attributes }
      }.to change(Product, :count).by(1)

      expect(response).to redirect_to(product_path(Product.last))
    end
  end

  describe "PATCH /update" do
    it "updates an existing product" do
      product = Product.create!(valid_attributes)
      patch "/products/#{product.id}", params: { product: updated_attributes }
      product.reload
      expect(product.name).to eq("Updated Product")
      expect(product.price).to eq(29.99)
      expect(product.description).to eq("Updated description")
      expect(response).to redirect_to(product_path(product))
    end
  end
end

