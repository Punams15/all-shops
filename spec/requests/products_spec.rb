require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /products" do
    it "returns a successful response" do
      get products_path
      expect(response).to have_http_status(:success)
    end
  end
end
