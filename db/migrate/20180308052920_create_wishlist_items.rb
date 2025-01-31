class CreateWishlistItems < ActiveRecord::Migration[5.1]
  def change
    create_table :wishlist_items do |t|
      t.belongs_to :wishlist, foreign_key: true
      t.string :shopify_product_id
      t.string :shopify_variant_id

      t.timestamps
    end
  end
end
