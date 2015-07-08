class AddTechnologicalSettingId < ActiveRecord::Migration
  def up
    add_column :guides, :technological_setting_id, :integer
    add_column :guides, :contextual_setting_id, :integer
  end

  def down
  end
end
