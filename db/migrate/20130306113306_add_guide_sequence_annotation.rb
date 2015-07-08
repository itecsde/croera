class AddGuideSequenceAnnotation < ActiveRecord::Migration
  def up
    create_table "guideSequenceAnnotations", :force => true do |t|
      t.integer "guide_id"
      t.integer "activity_sequence_id"
    end
  end

  def down
  end
end
