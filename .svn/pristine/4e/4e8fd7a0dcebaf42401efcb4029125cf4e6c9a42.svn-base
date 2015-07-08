class AddStepRequirementResourceAnnotation < ActiveRecord::Migration
  def up
    create_table "step_requirement_resource_annotation", :force => true do |t|
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
