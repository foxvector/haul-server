class Api::ProductsController < ApiController
  def index
    products = Product.where(remote_id: params[:ids].to_s.split(','))
                      .includes(:product_variants)
                      .limit(250)

    render jsonapi: products, include: [:product_variants]
  end
end
