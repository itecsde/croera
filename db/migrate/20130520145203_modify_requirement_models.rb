class ModifyRequirementModels < ActiveRecord::Migration
  def up
    add_column :person_concrete_requirements, :activity_id, :integer
    add_column :event_concrete_requirements, :activity_id, :integer
  end

  def down
  end
end
