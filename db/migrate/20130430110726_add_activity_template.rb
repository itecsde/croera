class AddActivityTemplate < ActiveRecord::Migration
  def up
    add_column :activities, :template, :boolean
  end

  def down
  end
end
