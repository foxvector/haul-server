# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180309072724) do

  create_table "product_variants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.string "remote_id"
    t.string "title"
    t.decimal "price", precision: 10, scale: 2
    t.decimal "compare_at_price", precision: 10, scale: 2
    t.string "sku"
    t.integer "position"
    t.integer "grams"
    t.integer "inventory_quantity"
    t.string "inventory_policy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_variants_on_product_id"
    t.index ["remote_id"], name: "index_product_variants_on_remote_id"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "shop_id"
    t.string "remote_id"
    t.string "title"
    t.text "body_html"
    t.string "vendor"
    t.string "product_type"
    t.string "handle"
    t.string "published_scope"
    t.text "tags"
    t.text "featured_image_url"
    t.decimal "price_min", precision: 10, scale: 2
    t.decimal "compare_price_min", precision: 10, scale: 2
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["remote_id"], name: "index_products_on_remote_id"
    t.index ["shop_id"], name: "index_products_on_shop_id"
  end

  create_table "shops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "shopify_domain", null: false
    t.string "shopify_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true
  end

  create_table "wishlist_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "wishlist_id"
    t.string "shopify_product_id"
    t.string "shopify_variant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wishlist_id"], name: "index_wishlist_items_on_wishlist_id"
  end

  create_table "wishlists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "shop_id"
    t.string "name"
    t.string "token"
    t.string "wishlist_type"
    t.string "shopify_customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_wishlists_on_shop_id"
    t.index ["token"], name: "index_wishlists_on_token"
  end

  add_foreign_key "product_variants", "products"
  add_foreign_key "products", "shops"
  add_foreign_key "wishlist_items", "wishlists"
  add_foreign_key "wishlists", "shops"
end
