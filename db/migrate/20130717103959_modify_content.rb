class ModifyContent < ActiveRecord::Migration
  def up
    remove_column :contents, :subject_id
    add_column :contents, :subject_id, :integer
  end

  def down
  end
end
