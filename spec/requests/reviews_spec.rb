require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  let(:valid_attributes) { { content: "Great product!", rating: 5 } }
  let(:updated_attributes) { { content: "Updated review", rating: 4 } }

  describe "GET /index" do
    it "returns http success" do
      get "/reviews"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      review = Review.create!(valid_attributes)
      get "/reviews/#{review.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "creates a new review" do
      expect {
        post "/reviews", params: { review: valid_attributes }
      }.to change(Review, :count).by(1)
      expect(response).to redirect_to(review_path(Review.last))
    end
  end

  describe "PATCH /update" do
    it "updates an existing review" do
      review = Review.create!(valid_attributes)
      patch "/reviews/#{review.id}", params: { review: updated_attributes }
      review.reload
      expect(review.content).to eq("Updated review")
      expect(review.rating).to eq(4)
      expect(response).to redirect_to(review_path(review))
    end
  end
end
