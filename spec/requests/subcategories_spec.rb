require 'rails_helper'

RSpec.describe "Subcategories", type: :request do
  let(:category) { Category.create!(name: "Parent Category", description: "Parent description") }
  let(:valid_attributes) { { name: "Test Subcategory", description: "Subcategory description", category_id: category.id } }
  let(:updated_attributes) { { name: "Updated Subcategory", description: "Updated description" } }

  describe "GET /index" do
    it "returns http success" do
      get "/categories/#{category.id}/subcategories"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      subcategory = Subcategory.create!(valid_attributes)
      get "/categories/#{category.id}/subcategories/#{subcategory.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "creates a new subcategory" do
      expect {
        post "/categories/#{category.id}/subcategories", params: { subcategory: valid_attributes }
      }.to change(Subcategory, :count).by(1)
      expect(response).to redirect_to(category_subcategory_path(category, Subcategory.last))
    end
  end

  describe "PATCH /update" do
    it "updates an existing subcategory" do
      subcategory = Subcategory.create!(valid_attributes)
      patch "/categories/#{category.id}/subcategories/#{subcategory.id}", params: { subcategory: updated_attributes }
      subcategory.reload
      expect(subcategory.name).to eq("Updated Subcategory")
      expect(subcategory.description).to eq("Updated description")
      expect(response).to redirect_to(category_subcategory_path(category, subcategory))
    end
  end
end

