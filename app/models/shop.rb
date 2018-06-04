class Shop < ActiveRecord::Base
  include ShopifyApp::SessionStorage

  has_many :products,  dependent: :destroy

  def session
    @session ||= self.class.session(self.shopify_domain, self.shopify_token)
  end

  def activate_session
    ShopifyAPI::Base.activate_session(self.session)
  end

  def self.session(domain, token)
    ShopifyAPI::Session.new(domain, token)
  end
end
