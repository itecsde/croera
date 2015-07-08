class ActivitySequenceId < ActiveRecord::Migration
  def up
    add_column :activity_instances, :activity_sequence_id, :integer
  end

  def down
  end
end
