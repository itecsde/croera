class ActivityElementDrop < ActiveRecord::Migration
  def up
    drop_table "activity_elements"
  end

  def down
  end
end
