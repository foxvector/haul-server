class Api::WishlistItemsController < ApiController
  # Sample Params
  # {
  #   id: '[token here]',
  #   customer_id: '123',
  #   product_id: '123123'
  # }
  def create
    item = WishlistItem.add(wishlist, params[:product_id])

    render json: item
  end

  def destroy
    item = WishlistItem.remove(wishlist, params[:product_id])
    render json: item
  end

  private

  def product
    @product ||= ShopifyAPI::Product.find(params[:wishlist_item][:product_id])
  end

  def wishlist
    shop.wishlists.find_or_create(wishlist_params)
  end

  def wishlist_params
    {
      token: params[:id],
      shopify_customer_id: params[:customer_id],
      name: product.title, # default
      wishlist_type: 'private', # default
    }
  end
end
