require 'rails_helper'

describe ProductSync do
  let!(:shop) { create :shop }

  before do
    ShopifyAPI::Base.activate_session(
      ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
    )
  end

  let!(:product_json) { JSON.parse(File.read('spec/fixtures/shopify_product.json')) }
  let!(:shopify_product) { ShopifyAPI::Product.new(product: product_json) }

  describe '#call' do
    context 'when product does not exist' do
      it 'creates the product' do
        expect {
          ProductSync.new(shop, shopify_product).call
        }.to change(Product, :count).by(1)
      end

      it 'returns a Product' do
        expect(ProductSync.new(shop, shopify_product).call).to be_a(Product)
      end
    end

    context 'when product exist' do
      before do
        create :product, shop: shop, remote_id: shopify_product.id
      end

      it 'updates the product' do
        expect_any_instance_of(Product).to receive(:update!)

        ProductSync.new(shop, shopify_product).call
      end

      it 'does not create a new Product' do
        expect {
          ProductSync.new(shop, shopify_product).call
        }.to change(Product, :count).by(0)
      end

      it 'returns a Product' do
        expect(ProductSync.new(shop, shopify_product).call).to be_a(Product)
      end
    end
  end
end
