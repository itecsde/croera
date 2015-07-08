class AddOwnableElements < ActiveRecord::Migration
  def up
    add_column :contents, :owner_id, :integer
    add_column :contents, :creator_id, :integer
    
    add_column :devices, :owner_id, :integer
    add_column :devices, :creator_id, :integer
    
    add_column :applications, :owner_id, :integer
    add_column :applications, :creator_id, :integer
    
    add_column :people, :owner_id, :integer
    add_column :people, :creator_id, :integer
    
    add_column :events, :owner_id, :integer
    add_column :events, :creator_id, :integer
    
    add_column :experiences, :owner_id, :integer
    add_column :experiences, :creator_id, :integer
  end

  def down
  end
end
