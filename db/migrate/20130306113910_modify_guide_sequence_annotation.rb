class ModifyGuideSequenceAnnotation < ActiveRecord::Migration
  def up
    drop_table "guideSequenceAnnotations"
    
    create_table "guide_sequence_annotations", :force => true do |t|
      t.integer "guide_id"
      t.integer "activity_sequence_id"
    end    
  end

  def down
  end
end
