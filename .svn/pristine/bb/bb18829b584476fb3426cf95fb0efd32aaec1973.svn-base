class ActivitiesTranslations < ActiveRecord::Migration
  def up

    drop_table :activities
    drop_table :requirements
    drop_table :activities_requirements
  
    create_table "activities", :force => true do |t|
      t.string   "title"
      t.text     "description"
      t.string   "icon"
      t.text     "guidelines"
      t.string   "time_to_complete"
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
    
  end

  def down
  end
end
