class AddBoxes < ActiveRecord::Migration
  def up
    drop_table :components
    
    create_table "boxes", :force => true do |t|
      t.integer "activity_id"
      t.string "box_type"
      t.integer "position"
    end
    
    create_table "components", :force => true do |t|
      t.integer "box_id"
      t.string  "component_type"
      t.integer "position"
    end
  end

  def down
  end
end
