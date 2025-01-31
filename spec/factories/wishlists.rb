FactoryBot.define do
  factory :wishlist do
    shop nil
    name 'My Private Wishlist'
    wishlist_type 'private'
    shopify_customer_id '123123'
  end
end
