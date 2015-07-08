class NewAssignments < ActiveRecord::Migration
  def up
    create_table :concrete_requirement_tool_assignments do |t|
      t.integer "concrete_requirement_id"
      t.string "tool_type"
      t.string "tool_id"
    end
    
    create_table :abstract_requirement_tool_assignments do |t|
      t.integer "abstract_requirement_id"
      t.string "tool_type"
      t.string "tool_id"
    end
    
    create_table :person_concrete_requirement_person_assignments do |t|
      t.integer "person_concrete_requirement_id"
      t.integer "person_id"
    end
    
    create_table :contributor_requirement_person_assignments do |t|
      t.integer "contributor_requirement_id"
      t.integer "person_id"
    end
    
    create_table :event_concrete_requirement_event_assignments do |t|
      t.integer "event_concrete_requirement_id"
      t.integer "event_id"
    end
    
    create_table :event_requirement_event_assignments do |t|
      t.integer "event_requirement_id"
      t.integer "event_id"
    end
    
  end

  def down
  end
end
