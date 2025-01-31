class Product < ApplicationRecord
  belongs_to :shop

  has_many :product_variants, dependent: :destroy

  validates :title, :vendor, :product_type,
            :handle, :price_min, :compare_price_min, presence: true

  validates :remote_id, uniqueness: { scope: :shop_id }
end
