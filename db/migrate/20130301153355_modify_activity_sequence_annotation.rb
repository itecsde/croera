class ModifyActivitySequenceAnnotation < ActiveRecord::Migration
  def up
    drop_table :activity_sequence_annotations
    create_table :activity_sequence_annotations, :force => true do |t|
      t.integer "activity_id"
      t.integer "activity_sequence_id"
    end
  end

  def down
  end
end
