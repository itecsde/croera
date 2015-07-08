class ModifyComponentsType < ActiveRecord::Migration
  def up
    rename_column :components, :type, :component_type
  end

  def down
  end
end
