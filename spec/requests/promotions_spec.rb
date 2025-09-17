require 'rails_helper'

RSpec.describe "Promotions", type: :request do
  let(:valid_attributes) { { title: "Test Promo", discount: 10 } }
  let(:updated_attributes) { { title: "Updated Promo", discount: 20 } }

  describe "GET /index" do
    it "returns http success" do
      get "/promotions"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      promo = Promotion.create!(valid_attributes)
      get "/promotions/#{promo.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "creates a new promotion" do
      expect {
        post "/promotions", params: { promotion: valid_attributes }
      }.to change(Promotion, :count).by(1)
      expect(response).to redirect_to(promotion_path(Promotion.last))
    end
  end

  describe "PATCH /update" do
    it "updates an existing promotion" do
      promo = Promotion.create!(valid_attributes)
      patch "/promotions/#{promo.id}", params: { promotion: updated_attributes }
      promo.reload
      expect(promo.title).to eq("Updated Promo")
      expect(promo.discount).to eq(20)
      expect(response).to redirect_to(promotion_path(promo))
    end
  end
end

