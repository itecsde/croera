class AddTimestampsToResources < ActiveRecord::Migration
  def change
    add_column :applications, :created_at, :datetime
    add_column :applications, :updated_at, :datetime
    
    add_column :devices, :created_at, :datetime
    add_column :devices, :updated_at, :datetime
    
    add_column :people, :created_at, :datetime
    add_column :people, :updated_at, :datetime
    
    add_column :events, :created_at, :datetime
    add_column :events, :updated_at, :datetime
  end
end
