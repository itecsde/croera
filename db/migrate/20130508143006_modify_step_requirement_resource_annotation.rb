class ModifyStepRequirementResourceAnnotation < ActiveRecord::Migration
  def up
    drop_table "step_requirement_resource_annotation"
    
    create_table "step_requirement_resource_annotations", :force => true do |t|
      t.integer "activity_instance_id"
      t.string "requirement_type"
      t.integer "requirement_id"
      t.string "resource_type"
      t.integer "resource_id"
    end    
  end

  def down
  end
end
