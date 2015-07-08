class GuidelineItemAdd < ActiveRecord::Migration
  def up
    create_table "guideline_item", :force => true do |t|
      t.integer "guidelines_preparation_id"
      t.integer "guidelines_introduction_id"
      t.integer "guidelines_activity_id"
      t.integer "guidelines_assessment_id"
    end
  end

  def down
  end
end
