class WishlistItem < ApplicationRecord
  belongs_to :wishlist

  validates :shopify_product_id, uniqueness: { scope: [:wishlist_id] }

  def self.add(wishlist, product_id)
    model = ShopifyAPI::Product.find(item_params[:product_id])
    Wishlist.find_or_create(token, model.title)
  end
end
