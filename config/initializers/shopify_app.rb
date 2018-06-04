ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = '23ec84a7a4c4e9097e51facc94d587e7'
  config.secret = '4bc44639cc357455086c387e539043e9'
  config.scope = "read_orders, read_products"
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = 'Shop'
  config.after_authenticate_job = { job: Shopify::AfterAuthenticateJob, inline: true }
  config.webhooks = [
      {topic: 'products/create', address: 'https://user52.mocstage.com/webhooks/products_create', format: 'json'},
      {topic: 'products/update', address: 'https://user52.mocstage.com/webhooks/products_update', format: 'json'},
      {topic: 'products/delete', address: 'https://user52.mocstage.com/webhooks/products_delete', format: 'json'},
  ]
end


