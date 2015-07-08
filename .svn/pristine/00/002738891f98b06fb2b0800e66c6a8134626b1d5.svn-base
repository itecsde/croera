class ActivityElementsAdd < ActiveRecord::Migration
  def up
    drop_table "guide_activity_element_annotation"
    
    create_table "guide_activity_element_annotations", :force => true do |t|
      t.integer "guide_id"
      t.integer "activity_element_id"
    end
      
  end

  def down
  end
end
