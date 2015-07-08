class AddOwnerSources < ActiveRecord::Migration
  def up
    add_column :sources, :owner_id, :integer
    add_column :sources, :owner_type, :string
    add_column :sources, :creator_id, :integer
  end

  def down
  end
end
