class ModifyGuidelineItem < ActiveRecord::Migration
  def up
    drop_table "guideline_item"
    create_table "guideline_items", :force => true do |t|
      t.integer "guidelines_preparation_id"
      t.integer "guidelines_introduction_id"
      t.integer "guidelines_activity_id"
      t.integer "guidelines_assessment_id"
    end
  end

  def down
  end
end
