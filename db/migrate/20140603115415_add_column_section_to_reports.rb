class AddColumnSectionToReports < ActiveRecord::Migration
  def change
    add_column :reports, :section, :string     
  end
end
