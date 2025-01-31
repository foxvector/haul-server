FactoryBot.define do
  factory :wishlist_item do
    wishlist { create :wishlist }
    shopify_product_id '123123'
    shopify_variant_id '321312'
  end
end
