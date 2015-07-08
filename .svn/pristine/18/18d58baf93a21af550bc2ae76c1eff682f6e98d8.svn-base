class AddTs < ActiveRecord::Migration
  def up
    create_table "technological_settings", :force => true do |t|
      t.string "name"
      t.text "description"
    end
    
    create_table "devices", :force => true do |t|
      t.string "name"
      t.text "description"
    end
    
    create_table "technological_setting_device_annotations", :force => true do |t|
      t.integer "technological_setting_id"
      t.integer "device_id"
    end
    
    create_table "applications", :force => true do |t|
      t.string "name"
      t.text "description"
    end
    
    create_table "technological_setting_application_annotations", :force => true do |t|
      t.integer "technological_setting_id"
      t.integer "application_id"
    end
    
    create_table "person", :force => true do |t|
      t.string "name"
      t.text "description"
    end
    
    create_table "event", :force => true do |t|
      t.string "name"
      t.text "description"
    end
  end

  def down
    drop_table "technological_settings"
    drop_table "devices"
    drop_table "technological_setting_device_annotations"
    drop_table "applications"
    drop_table "technological_setting_application_annotations"
    drop_table "person"
    drop_table "event"
  end
end
