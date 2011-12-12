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

ActiveRecord::Schema.define(:version => 20111211203948) do

  create_table "documents", :force => true do |t|
    t.string   "path"
    t.string   "title"
    t.string   "name"
    t.integer  "size"
    t.integer  "user_id"
    t.integer  "folder"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "folders", :force => true do |t|
    t.string   "name"
    t.string   "parent"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.text     "text"
    t.boolean  "readed",        :default => false, :null => false
    t.boolean  "showed_popup",  :default => false, :null => false
    t.boolean  "showed_dialog", :default => false, :null => false
    t.integer  "userto_id"
    t.integer  "userfrom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "new_messages", :force => true do |t|
    t.text     "text"
    t.boolean  "readed",        :default => false, :null => false
    t.boolean  "showed_popup",  :default => false, :null => false
    t.boolean  "showed_dialog", :default => false, :null => false
    t.integer  "userto_id"
    t.integer  "userfrom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prepodrooms", :force => true do |t|
    t.boolean  "images",       :default => true
    t.boolean  "students",     :default => true
    t.boolean  "subjects",     :default => true
    t.boolean  "shedules",     :default => true
    t.boolean  "marks",        :default => true
    t.boolean  "files",        :default => true
    t.boolean  "publications", :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prepods_subjects", :id => false, :force => true do |t|
    t.integer "prepod_id"
    t.integer "subject_id"
  end

  create_table "publication_cats", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publication_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publications", :force => true do |t|
    t.string   "title"
    t.text     "article"
    t.text     "prolog"
    t.integer  "level"
    t.integer  "publication_type_id"
    t.integer  "publication_cat_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publications_subjects", :id => false, :force => true do |t|
    t.integer "publication_id"
    t.integer "subject_id"
  end

  create_table "publications_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", :force => true do |t|
    t.boolean  "images",       :default => true
    t.boolean  "students",     :default => true
    t.boolean  "subjects",     :default => true
    t.boolean  "shedules",     :default => true
    t.boolean  "marks",        :default => true
    t.boolean  "files",        :default => true
    t.boolean  "publications", :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shedules", :force => true do |t|
    t.integer  "week"
    t.integer  "day"
    t.integer  "hour"
    t.integer  "classroom"
    t.integer  "sub_group2"
    t.integer  "sub_group3"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "second_name"
    t.string   "last_name"
    t.string   "login"
    t.string   "password"
    t.string   "email"
    t.string   "sex"
    t.string   "role"
    t.integer  "group_id"
    t.integer  "settings_id"
    t.integer  "pos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
