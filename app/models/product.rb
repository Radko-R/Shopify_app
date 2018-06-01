class Product < ApplicationRecord
  belongs_to :shop
  has_many :variants
end
