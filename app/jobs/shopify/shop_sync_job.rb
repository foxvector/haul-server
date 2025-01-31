class Shopify::ShopSyncJob < ApplicationJob
  queue_as :shopify_sync

  def perform(args = {})
    shop = Shop.find_by(shopify_domain: args[:shop_domain])

    ProductThrottle.new(shop).call
  end
end
