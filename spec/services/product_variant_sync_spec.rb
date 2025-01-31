require 'rails_helper'

describe ProductVariantSync do
  let!(:shop) { create :shop }

  before do
    ShopifyAPI::Base.activate_session(
      ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
    )
  end

  let!(:product_json) { JSON.parse(File.read('spec/fixtures/shopify_product.json')) }
  let!(:shopify_product) { ShopifyAPI::Product.new(product: product_json) }
  let!(:shopify_variant) { shopify_product.variants.first }

  let!(:product) { create :product, shop: shop }

  describe '#call' do
    context 'when product variant does not exist' do
      it 'creates the variant' do
        expect {
          ProductVariantSync.new(product, shopify_variant).call
        }.to change(ProductVariant, :count).by(1)
      end

      it 'returns a ProductVariant' do
        expect(ProductVariantSync.new(product, shopify_variant).call).to be_a(ProductVariant)
      end
    end

    context 'when product variant exist' do
      before do
        create :product_variant, product: product, remote_id: shopify_variant.id
      end

      it 'updates the variant' do
        expect_any_instance_of(ProductVariant).to receive(:update!)

        ProductVariantSync.new(product, shopify_variant).call
      end

      it 'does not create a new variant' do
        expect {
          ProductVariantSync.new(product, shopify_variant).call
        }.to change(ProductVariant, :count).by(0)
      end

      it 'returns a ProductVariant' do
        expect(ProductVariantSync.new(product, shopify_variant).call).to be_a(ProductVariant)
      end
    end
  end
end
