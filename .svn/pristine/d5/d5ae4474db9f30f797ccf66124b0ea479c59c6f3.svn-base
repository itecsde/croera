class ModifyApplicationsDevicesPeopleEvents < ActiveRecord::Migration
  def up
    drop_table "devices"
    
    create_table "devices", :force => true do |t|
      t.string "name"
        t.text   "description"
        t.string "itec_id"
    end
    
     drop_table "applications"
    
    create_table "applications", :force => true do |t|
      t.string "name"
        t.text   "description"
        t.string "itec_id"
    end
    
    drop_table "people"
    
    create_table "people", :force => true do |t|
      t.string "name"
        t.text   "description"
        t.string "itec_id"
    end
    
     drop_table "events"
    
    create_table "events", :force => true do |t|
      t.string "name"
        t.text   "description"
        t.string "itec_id"
    end
  end

  def down
  end
end
