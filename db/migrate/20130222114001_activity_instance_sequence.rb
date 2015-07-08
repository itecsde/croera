class ActivityInstanceSequence < ActiveRecord::Migration
  def up
    add_column :activity_instances, :position, :integer
  end

  def down
  end
end
