class AddActivityRequirement < ActiveRecord::Migration
  def up
    add_column :concrete_requirements, :activity_id, :integer
    add_column :abstract_requirements, :activity_id, :integer
    add_column :contributor_requirements, :activity_id, :integer
    add_column :event_requirements, :activity_id, :integer
  end

  def down
  end
end
