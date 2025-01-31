class Product < ApplicationRecord
  belongs_to :shop

  has_many :product_variants, dependent: :destroy

  validates :remote_id, uniqueness: { scope: :shop_id }
end
