require 'rails_helper'

RSpec.describe "Categories", type: :request do
  let(:valid_attributes) { { name: "Test Category", description: "Category description" } }
  let(:updated_attributes) { { name: "Updated Category", description: "Updated description" } }

  describe "GET /index" do
    it "returns http success" do
      get "/categories"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      category = Category.create!(valid_attributes)
      get "/categories/#{category.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "creates a new category" do
      expect {
        post "/categories", params: { category: valid_attributes }
      }.to change(Category, :count).by(1)
      expect(response).to redirect_to(category_path(Category.last))
    end
  end

  describe "PATCH /update" do
    it "updates an existing category" do
      category = Category.create!(valid_attributes)
      patch "/categories/#{category.id}", params: { category: updated_attributes }
      category.reload
      expect(category.name).to eq("Updated Category")
      expect(category.description).to eq("Updated description")
      expect(response).to redirect_to(category_path(category))
    end
  end
end

