class ProductSync
  attr_reader :shop, :product, :variants

  def initialize(shop, product)
    @shop     = shop
    @product  = product
    @variants = product.variants
  end

  def call
    if existing_product
      existing_product.update!(product_params)
      existing_product
    else
      shop.products.create!(product_params)
    end
  end

  private

  def existing_product
    @existing_product ||= shop.products.find_by(remote_id: product.id)
  end

  def product_params
    {
      remote_id:          product.id,
      title:              product.title,
      body_html:          product.body_html,
      vendor:             product.vendor,
      product_type:       product.product_type,
      handle:             product.handle,
      published_scope:    product.published_scope,
      featured_image_url: product.image.try(:src),
      tags:               product.tags,
      price_min:          price_min,
      compare_price_min:  compare_price_min,
      available:          available?
    }
  end

  def price_min
    variant = variants.sort_by(&:price).first

    variant.price if variant.present?
  end

  def compare_price_min
    variant = variants.sort_by(&:compare_at_price).first

    variant.compare_at_price if variant.present?
  end

  def available?
    variants.any? { |v| v.inventory_policy == 'deny' && v.inventory_quantity > 0 }
  end
end
