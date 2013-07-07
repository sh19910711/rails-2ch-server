# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130707100510) do

  create_table "bbs_board_threads", :force => true do |t|
    t.integer  "bbs_board_id",  :null => false
    t.integer  "bbs_thread_id", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "bbs_board_threads", ["bbs_board_id"], :name => "fk_bbs_board_threads_bbs_boards_idx"
  add_index "bbs_board_threads", ["bbs_thread_id"], :name => "bbs_thread_id_UNIQUE", :unique => true
  add_index "bbs_board_threads", ["bbs_thread_id"], :name => "fk_bbs_board_threads_bbs_threads1_idx"
  add_index "bbs_board_threads", ["id"], :name => "id_UNIQUE", :unique => true

  create_table "bbs_boards", :force => true do |t|
    t.string   "key",         :limit => 64,  :null => false
    t.string   "screen_name", :limit => 256, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "bbs_boards", ["id"], :name => "id_UNIQUE", :unique => true
  add_index "bbs_boards", ["key"], :name => "key_UNIQUE", :unique => true

  create_table "bbs_responses", :force => true do |t|
    t.string   "key",        :limit => 64,   :null => false
    t.string   "name",       :limit => 256,  :null => false
    t.string   "mail",       :limit => 256,  :null => false
    t.string   "info",       :limit => 512,  :null => false
    t.string   "body",       :limit => 4096, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "bbs_responses", ["id"], :name => "id_UNIQUE", :unique => true
  add_index "bbs_responses", ["key"], :name => "key_UNIQUE", :unique => true

  create_table "bbs_thread_responses", :force => true do |t|
    t.integer  "bbs_thread_id",   :null => false
    t.integer  "bbs_response_id", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "bbs_thread_responses", ["bbs_response_id"], :name => "bbs_response_id_UNIQUE", :unique => true
  add_index "bbs_thread_responses", ["bbs_response_id"], :name => "fk_bbs_thread_responses_bbs_responses1_idx"
  add_index "bbs_thread_responses", ["bbs_thread_id"], :name => "fk_bbs_thread_responses_bbs_threads1_idx"
  add_index "bbs_thread_responses", ["id"], :name => "id_UNIQUE", :unique => true

  create_table "bbs_threads", :force => true do |t|
    t.string   "key",         :limit => 64,  :null => false
    t.string   "screen_name", :limit => 256, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "bbs_threads", ["id"], :name => "id_UNIQUE", :unique => true
  add_index "bbs_threads", ["key"], :name => "key_UNIQUE", :unique => true

end
