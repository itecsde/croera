class ModifyActivity < ActiveRecord::Migration
  def up
    add_column :activities, :referenced_activity_id, :integer
  end

  def down
  end
end
