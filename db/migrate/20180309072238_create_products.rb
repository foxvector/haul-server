class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.belongs_to :shop, foreign_key: true
      t.string     :remote_id
      t.string     :title
      t.text       :body_html
      t.string     :vendor
      t.string     :product_type
      t.string     :handle
      t.string     :published_scope
      t.text       :tags
      t.text       :featured_image_url
      t.decimal    :price_min, precision: 10, scale: 2
      t.decimal    :compare_price_min, precision: 10, scale: 2
      t.boolean    :available

      t.timestamps
    end

    add_index :products, :remote_id
  end
end
