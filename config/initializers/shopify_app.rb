ShopifyApp.configure do |config|
  website_url = Rails.application.secrets.website_url.to_s

  config.application_name = 'JapanHaul App'
  config.api_key = Rails.application.secrets.shopify_api_key
  config.secret= Rails.application.secrets.shopify_secret
  config.scope = 'read_orders, read_products, write_script_tags'
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop

  config.webhook_jobs_namespace = 'shopify'

  # Webhooks
  config.webhooks = [
    { topic: 'products/create', address: website_url + '/webhooks/products_create' },
    { topic: 'products/update', address: website_url + '/webhooks/products_update' },
    { topic: 'products/delete', address: website_url + '/webhooks/products_delete' },
  ]

  config.after_authenticate_job = { job: Shopify::ShopSyncJob }
end
