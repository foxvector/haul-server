FactoryBot.define do
  factory :product do
    shop { create :shop }
    remote_id '123'
    title 'Alpcasso'
    body_html '<p>description here</p>'
    vendor 'Bandai'
    product_type 'Plushie'
    handle 'alpacasso-test'
    published_scope 'global'
    tags 'plushie, Plushie'
    featured_image_url 'https://cdn.shopify.com/s/files/1/2699/6536/products/160606-11_4448e759-c240-4bc1-9f0c-304d20c97a3b.jpg?v=1517795255'
    price_min '9.99'
    compare_price_min '9.99'
  end
end
