class AddEventTimestamps < ActiveRecord::Migration
  def up
    add_column :events, :created_at, :datetime
    add_column :events, :updated_at, :datetime
    add_column :events, :owner_id, :integer
    add_column :events, :creator_id, :integer
  end

  def down
  end
end
