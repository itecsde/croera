class RenameNewsToReports < ActiveRecord::Migration
  def up
    rename_table :news, :reports
  end

  def down
  end
end
