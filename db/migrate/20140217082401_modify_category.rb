class ModifyCategory < ActiveRecord::Migration
  def up
    rename_column :categories, :category, :name
  end

  def down
  end
end
