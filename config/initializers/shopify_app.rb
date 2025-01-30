ShopifyApp.configure do |config|
  config.application_name = 'JapanHaul App'
  config.api_key = Rails.application.secrets.shopify_api_key
  config.secret= Rails.application.secrets.shopify_secret
  config.scope = 'read_orders, read_products'
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
end
