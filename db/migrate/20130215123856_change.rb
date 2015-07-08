class Change < ActiveRecord::Migration
  def up
    
  drop_table "activities"
  drop_table "activities_requirements"
  drop_table "activity_translations"
  drop_table "elements"
  drop_table "guide_resource_annotations"
  drop_table "guides"
  drop_table "languages"
  drop_table "proposals"
  drop_table "requirements"
  drop_table "resources"
  drop_table "users"
  
  
  
    
  create_table "activities", :force => true do |t|
    t.string   "title"
    t.string   "icon"
    t.integer  "time_to_complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activities_requirements", :id => false, :force => true do |t|
    t.integer "activity_id"
    t.integer "requirement_id"
  end

  create_table "activity_translations", :force => true do |t|
    t.integer "activity_id"
    t.string  "locale"
    t.string  "name"
    t.text    "description"
    t.text    "teacherMotivation"
    t.text    "learnerMotivation"
    t.text    "technicalMotivation"
    t.text    "guidelines"
  end

  create_table "activity_sequences", :force => true do |t|
    t.string "name"
    t.text "description"
  end
  
  create_table "activity_elements", :force => true do |t|
    t.string "type"
  end

  create_table "guide_resource_annotations", :force => true do |t|
    t.integer "guide_id"
    t.integer "resource_id"
  end

  create_table "guides", :force => true do |t|
    t.string "name"
    t.text "description"
  end

  create_table "requirements", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", :force => true do |t|
    t.string "name"
    t.text "description"
  end

  create_table "users", :force => true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  end

  def down
  end
end
