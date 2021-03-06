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

ActiveRecord::Schema.define(version: 2020_03_02_073838) do

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_brands_on_category_id"
  end

  create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "customer_id", null: false
    t.string "card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliver_addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "family_name2", null: false
    t.string "first_name2", null: false
    t.string "family_name_kana2", null: false
    t.string "first_name_kana2", null: false
    t.integer "zip_code", null: false
    t.string "prefecture", null: false
    t.string "city", null: false
    t.string "address1", null: false
    t.string "address2"
    t.string "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_deliver_addresses_on_user_id"
  end

  create_table "item_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.string "image_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_images_on_item_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "condition", default: "0", null: false
    t.string "postage", default: "0", null: false
    t.integer "shipping_means_id"
    t.integer "prefecture_id", null: false
    t.integer "buyer_id"
    t.string "shipping_date", default: "0", null: false
    t.text "text", null: false
    t.integer "price", null: false
    t.integer "category_parent_id", null: false
    t.integer "category_child_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "saler_id", null: false
    t.bigint "category_grand_child_id", null: false
    t.string "brand"
    t.integer "likes_count"
    t.index ["category_grand_child_id"], name: "index_items_on_category_grand_child_id"
    t.index ["saler_id"], name: "index_items_on_saler_id"
  end

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_likes_on_item_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname", null: false
    t.string "family_name", null: false
    t.string "first_name", null: false
    t.string "family_name_kana", null: false
    t.string "first_name_kana", null: false
    t.date "birthday", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "brands", "categories"
  add_foreign_key "deliver_addresses", "users"
  add_foreign_key "item_images", "items"
  add_foreign_key "items", "categories", column: "category_grand_child_id"
  add_foreign_key "items", "users", column: "saler_id"
  add_foreign_key "likes", "items"
  add_foreign_key "likes", "users"
end
