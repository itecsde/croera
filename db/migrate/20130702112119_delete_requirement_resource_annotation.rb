class DeleteRequirementResourceAnnotation < ActiveRecord::Migration
  def up
    drop_table :requirement_resource_annotations
  end

  def down
  end
end
