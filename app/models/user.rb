class User < ApplicationRecord
  has_secure_password

  # Seller associations
  has_one :shop, dependent: :destroy        # a seller can have one shop
  has_many :products, through: :shop       # all products from this seller

  # Buyer associations
  has_many :orders, dependent: :nullify
  has_many :reviews, dependent: :destroy

  # Validations
  validates :email, presence: true, uniqueness: true

  # Helper method for admin
  def admin?
    self.admin
  end
end

# Fields (for reference / migration):
# email:string
# password_digest:string
# name:string (optional)
# admin:boolean (optional, default: false)
