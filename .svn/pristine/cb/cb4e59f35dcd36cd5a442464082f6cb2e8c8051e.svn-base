class AddActivityRequirementKeys < ActiveRecord::Migration
  def up
    add_column :activities, :id, :primary_key
    add_column :requirements, :id, :primary_key
  end

  def down
    remove_column :activities, :id
    remove_column :requirements, :id
  end
end
