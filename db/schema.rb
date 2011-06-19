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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110528211741) do

  create_table "news_items", :force => true do |t|
    t.integer  "source_id"
    t.string   "title"
    t.string   "link"
    t.datetime "published_at"
    t.integer  "total_votes",     :default => 0
    t.datetime "last_clicked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "news_items", ["id"], :name => "index_news_items_on_id"
  add_index "news_items", ["source_id"], :name => "index_news_items_on_source_id"

  create_table "source_categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "source_categories", ["id"], :name => "index_source_categories_on_id"

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.string   "homepage_url"
    t.string   "rss_url"
    t.integer  "source_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sources", ["id"], :name => "index_sources_on_id"

end
