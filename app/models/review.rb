class Review < ApplicationRecord
  belongs_to :user      # reviewer
  belongs_to :product

  validates :rating, presence: true
  validates :comment, presence: true
end

#Fields:

#user_id:integer

#product_id:integer

#rating:integer (1–5)

#comment:text