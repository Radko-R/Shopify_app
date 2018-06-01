class CartsUpdateJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)
    shop.activate_session
    ShopifyAPI::Product.find(:all, params:{limit: 5})
  end
end
