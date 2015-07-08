class RequirementsClasses < ActiveRecord::Migration
  def up
    create_table "functionalities", :force => true do |t|
      t.string "name"
      t.text "description"
    end
    
    create_table "requirement_functionality_annotations", :force => true do |t|
      t.integer "requirement_id"
      t.integer "functionality_id"
    end
    
    create_table "requirement_resource_annotations", :force => true do |t|
      t.integer "requirement_id"
      t.integer "resource_id"
    end
    
    create_table "levels", :force => true do |t|
      t.string "name"
      t.text "description"
    end
    
    create_table "requirement_level_annotations", :force => true do |t|
      t.integer "requirement_id"
      t.integer "level_id"
    end
  end

  def down
  end
end
