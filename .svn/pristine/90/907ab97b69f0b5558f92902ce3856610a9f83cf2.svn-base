class OwnableElements < ActiveRecord::Migration
  def up
    add_column :activities, :owner_id, :integer
    add_column :activities, :creator_id, :integer
    add_column :activities, :trace_id, :integer
    add_column :activities, :trace_version, :integer
    add_column :activity_sequences, :owner_id, :integer
    add_column :activity_sequences, :creator_id, :integer
    add_column :activity_sequences, :trace_id, :integer
    add_column :activity_sequences, :trace_version, :integer
    add_column :guides, :owner_id, :integer
    add_column :guides, :creator_id, :integer
    add_column :guides, :trace_id, :integer
    add_column :guides, :trace_version, :integer
  end

  def down
  end
end
