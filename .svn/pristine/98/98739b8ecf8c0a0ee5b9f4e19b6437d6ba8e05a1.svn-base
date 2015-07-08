class ModifyApplicationsDevices < ActiveRecord::Migration
  def up
    drop_table "devices"
    
    create_table "devices", :force => true do |t|
      t.string "name"
        t.text   "description"
        t.string "id_ld"
    end
    
     drop_table "applications"
    
    create_table "applications", :force => true do |t|
      t.string "name"
        t.text   "description"
        t.string "id_ld"
    end
  end

  def down
  end
end
