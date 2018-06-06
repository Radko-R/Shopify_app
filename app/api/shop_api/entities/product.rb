module ShopApi
  module Entities
    class Product < Grape::Entity
      expose :id
      expose :title
      expose :handle
    end
  end
end
