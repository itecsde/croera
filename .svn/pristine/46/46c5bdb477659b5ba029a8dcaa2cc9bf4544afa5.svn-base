class ChangeContributionTypeAnnotation < ActiveRecord::Migration
  def up
    remove_column :experience_step_contribution_annotations, :contribution_type
    add_column :experience_step_contribution_annotations, :contribution_type, :string
  end

  def down
  end
end
