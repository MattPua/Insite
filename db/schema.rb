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

ActiveRecord::Schema.define(:version => 20130929144423) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "interview_relationships", :force => true do |t|
    t.integer  "interview_id"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "interview_relationships", ["interview_id"], :name => "index_interview_relationships_on_interview_id"
  add_index "interview_relationships", ["user_id", "interview_id"], :name => "index_interview_relationships_on_user_id_and_interview_id", :unique => true
  add_index "interview_relationships", ["user_id"], :name => "index_interview_relationships_on_user_id"

  create_table "interviews", :force => true do |t|
    t.string   "company_name"
    t.string   "position"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "relationships", :force => true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "interview_id"
  end

  add_index "relationships", ["company_id", "user_id"], :name => "index_relationships_on_company_id_and_user_id", :unique => true
  add_index "relationships", ["company_id"], :name => "index_relationships_on_company_id"
  add_index "relationships", ["interview_id"], :name => "index_relationships_on_interview_id"
  add_index "relationships", ["user_id", "interview_id"], :name => "index_relationships_on_user_id_and_interview_id", :unique => true
  add_index "relationships", ["user_id"], :name => "index_relationships_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "year"
    t.string   "program"
    t.string   "faculty"
    t.integer  "phone"
    t.boolean  "registerterms"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
