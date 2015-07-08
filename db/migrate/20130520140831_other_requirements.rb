class OtherRequirements < ActiveRecord::Migration
  def up
    create_table "person_concrete_requirements", :force => true do |t|
      t.string "name"
      t.string "optionality"
      t.text "description"
    end
    
    create_table "person_concrete_requirement_person_annotations", :force => true do |t|
      t.integer "person_concrete_requirement_id"
      t.integer "person_id"
    end
    
    create_table "event_concrete_requirements", :force => true do |t|
      t.string "name"
      t.string "optionality"
      t.text "description"
    end
    
    create_table "event_concrete_requirement_event_annotations", :force => true do |t|
      t.integer "event_concrete_requirement_id"
      t.integer "event_id"
    end
  end

  def down
  end
end
