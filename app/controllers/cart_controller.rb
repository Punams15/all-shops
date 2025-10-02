RSpec.describe "Cart", type: :request do
  describe "GET /cart" do
    it "prevents unauthenticated users from seeing the cart" do
      get cart_path
      expect(response).to have_http_status(:forbidden).or have_http_status(:redirect)
    end
  end
end

