class Order < ApplicationRecord
  belongs_to :user       # buyer
  belongs_to :product

  # Optional fields for tracking
  # status:string (pending, shipped, delivered)
  # total_price:decimal
  # shipping_address:string
  # paid:boolean
end

#Fields:

#user_id:integer

#product_id:integer

#quantity:integer

#total_price:decimal

#status:string

#shipping_address:string

#paid:boolean
