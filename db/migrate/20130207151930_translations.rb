class Translations < ActiveRecord::Migration
  def up

   drop_table :activities
    drop_table :requirements
    drop_table :activities_requirements
    drop_table :languages
    drop_table :activities_translations
  
    create_table "activities", :force => true do |t|
      t.string   "title"
      t.text     "description"
      t.string   "icon"
      t.integer   "time_to_complete"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  
    create_table "requirements", :force => true do |t|
      t.string   "name"
      t.text     "description"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  
    create_table "activities_requirements", :id => false, :force => true do |t|
      t.integer "activity_id"
      t.integer "requirement_id"
    end    
    
    create_table "languages", :force => true do |t|
      t.string "lang"
    end
    
    create_table "activity_translations", :force => true do |t|
      t.integer "activity_id"
      t.integer "language_id"
      t.string  "name"
      t.text "description"
      t.text "teacherMotivation"
      t.text "learnerMotivation"
      t.text "technicalMotivation"
      t.text "guidelines"
    end
  end

  def down
  end
end