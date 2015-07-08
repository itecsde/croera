class AddActivitySequenceAnnotation < ActiveRecord::Migration
  def up
    create_table "activity_sequence_annotations", :force => true do |t|
      t.integer "activity_id"
      t.integer "teacher_id"
    end
  end

  def down
  end
end
