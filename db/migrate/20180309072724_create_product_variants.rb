class CreateProductVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :product_variants do |t|
      t.belongs_to :product, foreign_key: true
      t.string     :remote_id
      t.string     :title
      t.decimal    :price, precision: 10, scale: 2
      t.decimal    :compare_at_price, precision: 10, scale: 2
      t.string     :sku
      t.integer    :position
      t.integer    :grams
      t.integer    :inventory_quantity
      t.string     :inventory_policy

      t.timestamps
    end

    add_index :product_variants, :remote_id
  end
end
