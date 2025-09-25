class Product < ApplicationRecord
  belongs_to :shop
  has_many :orders
  has_many :reviews, dependent: :destroy
end

#Fields:

#name:string

#description:text

#price:decimal

#stock:integer

#shop_id:integer