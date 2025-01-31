class ProductVariantSync
  attr_reader :product, :variant

  def initialize(product, variant)
    @product = product
    @variant = variant
  end

  def call
    if existing_variant
      existing_variant.update!(variant_params)
    else
      product.product_variants.create!(variant_params)
    end
  end

  private

  def variant_params
    {
      remote_id:          variant.id,
      title:              variant.title,
      price:              variant.price,
      compare_at_price:   variant.compare_at_price,
      sku:                variant.sku,
      position:           variant.position,
      grams:              variant.grams,
      inventory_quantity: variant.inventory_quantity,
      inventory_policy:   variant.inventory_policy
    }
  end
end
