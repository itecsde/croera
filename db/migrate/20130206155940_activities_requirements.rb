class ActivitiesRequirements < ActiveRecord::Migration
  def up
    create_table :activities_requirements, :id => false do |t|
      t.integer :activity_id
      t.integer :requirement_id
    end
  end

  def down
  end
end
