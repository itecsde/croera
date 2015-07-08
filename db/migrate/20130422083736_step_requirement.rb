class StepRequirement < ActiveRecord::Migration
  def up
    create_table "activity_requirement_annotation", :force => true do |t|
      t.integer "activity_id"
      t.integer "requirement_id"
    end
  end

  def down
  end
end
