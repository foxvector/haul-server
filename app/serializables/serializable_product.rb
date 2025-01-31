class SerializableProduct < JSONAPI::Serializable::Resource
  type 'products'

  id { @object.remote_id }

  attributes :title, :body_html, :vendor, :product_type, :handle,
             :available, :featured_image_url, :price_min, :compare_price_min

  has_many :product_variants
end
