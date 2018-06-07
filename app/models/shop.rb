class Shop < ApplicationRecord
  include ShopifyApp::SessionStorage

  has_many :products, dependent: :destroy

  def session
    @session ||= self.class.session(shopify_domain, shopify_token)
  end

  def activate_session
    ShopifyAPI::Base.activate_session(session)
  end

  def self.session(domain, token)
    ShopifyAPI::Session.new(domain, token)
  end
end
