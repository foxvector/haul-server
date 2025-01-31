class Shop < ActiveRecord::Base
  include ShopifyApp::SessionStorage

  has_many :products, dependent: :destroy
  has_many :wishlists, dependent: :destroy
end
