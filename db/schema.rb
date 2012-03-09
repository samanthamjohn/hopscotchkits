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

ActiveRecord::Schema.define(:version => 20120308050833) do

  create_table "kits", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon_url"
    t.boolean  "published"
    t.text     "blurb"
  end

  create_table "programs", :force => true do |t|
    t.string   "name"
    t.integer  "progress"
    t.text     "code"
    t.integer  "kit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "step_id"
    t.integer  "user_id"
    t.boolean  "featured",   :default => false
  end

  create_table "requirements", :force => true do |t|
    t.string   "name"
    t.text     "spec"
    t.integer  "step_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "success"
  end

  create_table "snapshots", :force => true do |t|
    t.text     "code"
    t.integer  "program_id"
    t.integer  "step_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steps", :force => true do |t|
    t.integer  "kit_id"
    t.text     "description"
    t.text     "spec"
    t.text     "success_message"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "hint"
    t.text     "solution"
    t.string   "image_url"
    t.boolean  "bonus",           :default => false
    t.boolean  "freeplay",        :default => false
    t.text     "more_info"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "token"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
