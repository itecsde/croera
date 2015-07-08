class AddPositionToActivitySequenceAnnotation < ActiveRecord::Migration
  def change
    add_column :activity_sequence_annotations, :position, :integer
  end
end
