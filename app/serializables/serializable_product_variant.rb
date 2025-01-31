class SerializableProductVariant < JSONAPI::Serializable::Resource
  type 'product_variants'
  id { @object.remote_id.to_i }

  attributes :title, :price, :compare_at_price, :position, :inventory_quantity
end
