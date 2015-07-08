class ModifyComponents < ActiveRecord::Migration
  def up
    drop_table "component"
    drop_table "prose"
    
    create_table "components", :force => true do |t|
      t.integer "activity_id"
      t.string "type"
    end
    
    create_table "proses", :force => true do |t|
      t.integer "component_id"
      t.text "content"
    end
  end

  def down
  end
end
