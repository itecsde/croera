class DropSeveral < ActiveRecord::Migration
  def up
    drop_table "guide_activity_element_annotations"
    drop_table "guides"
    
    create_table "guides", :force => true do |t|
      t.string "name"
      t.text "description"
      t.integer "abstract_activity_id"
      t.string "abstract_activity_type"
    end
  end

  def down
  end
end
