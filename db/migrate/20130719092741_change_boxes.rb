class ChangeBoxes < ActiveRecord::Migration
  def up
    add_column :boxes, :activity_id, :integer
  end

  def down
  end
end
