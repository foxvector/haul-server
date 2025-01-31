FactoryBot.define do
  factory :product_variant do
    product { create :product }
    remote_id '123'
    title 'Default Title'
    price '9.99'
    compare_at_price '9.99'
    sku 'PRODUCT-VARIANT-01'
    position 1
    grams 100
  end
end
