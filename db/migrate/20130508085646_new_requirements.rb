class NewRequirements < ActiveRecord::Migration
  def up
    create_table "concrete_requirements", :force => true do |t|
      t.string "name"
      t.string "optionality"
      t.text "description"
    end
    
    create_table "concrete_requirement_tool_annotations", :force => true do |t|
      t.integer "concrete_requirement_id"
      t.string "tool_type"
      t.string "tool_id"
    end
    
    create_table "abstract_requirements", :force => true do |t|
      t.string "name"
      t.string "optionality"
      t.text "description"
    end
    
    create_table "abstract_requirement_functionality_annotations", :force => true do |t|
      t.integer "abstract_requirement_id"
      t.integer "functionality_id"
    end
    
    create_table "contributor_requirements", :force => true do |t|
      t.string "name"
      t.string "optionality"
      t.text "description"
    end
    
    create_table "contributor_requirement_person_category_annotations", :force => true do |t|
      t.integer "contributor_requirement_id"
      t.integer "person_category_id"
    end
    
    create_table "contributor_requirement_person_role_annotations", :force => true do |t|
      t.integer "contributor_requirement_id"
      t.integer "person_role_id"
    end
    
    create_table "event_requirements", :force => true do |t|
      t.string "name"
      t.string "optionality"
      t.text "description"
    end
    
    create_table "event_requirement_event_type_annotations", :force => true do |t|
      t.integer "event_requirement_id"
      t.integer "event_type_id"
    end
    
    create_table "event_requirement_event_place_annotations", :force => true do |t|
      t.integer "event_requirement_id"
      t.integer "event_place_id"
    end
  end

  def down
  end
end
