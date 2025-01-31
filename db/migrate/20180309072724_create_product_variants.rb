class CreateProductVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :product_variants do |t|
      t.belongs_to :product, foreign_key: true
      t.string     :remote_id
      t.string     :title
      t.decimal    :price
      t.decimal    :compare_at_price
      t.string     :sku
      t.integer    :position
      t.integer    :grams

      t.timestamps
    end
  end
end
