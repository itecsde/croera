class AddTimeStamps < ActiveRecord::Migration
  def up
    add_column :activity_sequences, :created_at, :datetime
    add_column :activity_sequences, :updated_at, :datetime
    add_column :guides, :created_at, :datetime
    add_column :guides, :updated_at, :datetime
    
  
  end

  def down
  end
end
