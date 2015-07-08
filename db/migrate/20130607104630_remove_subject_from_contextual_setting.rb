class RemoveSubjectFromContextualSetting < ActiveRecord::Migration
  def up
    remove_column :contextual_settings, :subject
  end

  def down
  end
end
