FactoryBot.define do
  factory :wishlist do
    shop { create :shop }
    name 'My Private Wishlist'
    wishlist_type 'private'
    shopify_customer_id '123123'
  end
end
