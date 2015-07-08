class ChangeCircumstances < ActiveRecord::Migration
  def up
    change_table :circumstances do |t|
      t.remove :operating_system
      t.integer :operating_system_id
      t.remove :educational_level
      t.integer :educational_level_id
    end
  end

  def down
  end
end
