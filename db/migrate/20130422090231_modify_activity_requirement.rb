class ModifyActivityRequirement < ActiveRecord::Migration
  def up
    drop_table "activity_requirement_annotation"

    create_table "activity_requirement_annotations", :force => true do |t|
      t.integer "activity_id"
      t.integer "requirement_id"
    end    
  end

  def down
  end
end
