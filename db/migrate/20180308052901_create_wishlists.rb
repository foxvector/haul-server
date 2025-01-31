class CreateWishlists < ActiveRecord::Migration[5.1]
  def change
    create_table :wishlists do |t|
      t.belongs_to :shop, foreign_key: true
      t.string :name
      t.string :wishlist_type
      t.string :shopify_customer_id

      t.timestamps
    end
  end
end
