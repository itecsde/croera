class ChangeExperienceStepAnnotations < ActiveRecord::Migration
  def up
    drop_table "experience_step_contribution_annotation"
    
    
    create_table "experience_step_contribution_annotations", :force => true do |t|
      t.string  "name"
      t.text    "description"
      t.integer "position"
      t.integer "experience_step_id"
      t.integer "contribution_type"
      t.integer "contribution_id"
    end
  end

  def down
  end
end
