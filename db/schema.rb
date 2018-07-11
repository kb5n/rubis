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

ActiveRecord::Schema.define(version: 2018_06_26_020514) do

  create_table "article_tags", force: :cascade do |t|
    t.integer "article_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_tags_on_article_id"
    t.index ["tag_id"], name: "index_article_tags_on_tag_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title", null: false
    t.string "identifier", null: false
    t.integer "status", null: false
    t.datetime "published_at", default: "2018-07-05 09:06:59", null: false
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_articles_on_category_id"
    t.index ["identifier"], name: "index_articles_on_identifier", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "identifier", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_categories_on_identifier", unique: true
  end

  create_table "sections", force: :cascade do |t|
    t.integer "article_id"
    t.integer "content_type"
    t.integer "sequence", null: false
    t.string "title"
    t.text "description"
    t.string "image_id"
    t.string "image_filename"
    t.string "image_content_size"
    t.string "image_content_type"
    t.text "url"
    t.string "og_site_name"
    t.string "og_title"
    t.text "og_description"
    t.text "og_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_sections_on_article_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "title", null: false
    t.string "description"
    t.string "copyright", null: false
    t.date "started_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.string "identifier", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_tags_on_identifier", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.string "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token"
  end

end
