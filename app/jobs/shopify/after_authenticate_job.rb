module Shopify
  class AfterAuthenticateJob < ActiveJob::Base
    def perform(shop_domain:)
      shop = Shop.find_by(shopify_domain:shop_domain)
      shop.activate_session
      shopify_products = ShopifyAPI::Product.find(:all, params: {fields: ['id', 'handle', 'title', 'variants']})
      shopify_products.each do |shopify_product|
        product = shop.products.find_or_initialize_by(shopify_id: shopify_product.id)
        product.title = shopify_product.title
        product.handle = shopify_product.handle

        shopify_product.variants.each do |shopify_variant|
          product.variants.find_or_initialize_by(shopify_id: shopify_variant.id)
          variant.price = shopify_variant.price
        end
        product.save!
      end
    ensure
      ShopifyAPI::Base.clear_session
    end
  end
end
