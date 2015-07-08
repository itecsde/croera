class DeleteGuideSequenceAnnotation < ActiveRecord::Migration
  def up
    drop_table :guide_sequence_annotations
  end

  def down
  end
end
