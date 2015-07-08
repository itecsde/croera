class RenameCircumstanceTable < ActiveRecord::Migration
  def up
    rename_table :circumstance, :circumstances
  end

  def down
  end
end
