class Shop < ApplicationRecord
  belongs_to :user            # owner of the shop
  has_many :products, dependent: :destroy
  has_many :reviews, through: :products
end

#Fields:

#name:string

#description:text

#user_id:integer