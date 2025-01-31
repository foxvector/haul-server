class Shopify::ProductsDeleteJob < ApplicationJob
  queue_as :shopify_sync

  def perform(args = {})
    shop = Shop.find_by(shopify_domain: args[:shop_domain])

    access = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)

    ShopifyAPI::Base.activate_session(access)

    product = shop.products.where(remote_id: args[:webhook][:id]).first

    product.destroy if product.present?
  end
end
