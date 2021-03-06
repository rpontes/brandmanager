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

ActiveRecord::Schema.define(:version => 20120814023641) do

  create_table "brands", :force => true do |t|
    t.integer  "number_process", :null => false
    t.string   "name",          :null => false
    t.integer  "client_id",     :null => false
    t.integer  "user_id",   :null => false
    t.string   "procedure"
    t.date     "date_rpi"
    t.date     "date_company"
    t.date     "deadline",      :null => false
    t.boolean  "completed"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "brands", ["client_id"], :name => "index_brands_on_client_id"
  add_index "brands", ["user_id"], :name => "index_brands_on_user_id"

  create_table "clients", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "telephone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",                             :null => false
    t.string   "email",                            :null => false
    t.string   "password_hash",                    :null => false
    t.string   "password_salt",                    :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.boolean  "admin",         :default => false, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
