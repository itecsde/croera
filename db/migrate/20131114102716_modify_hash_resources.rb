class ModifyHashResources < ActiveRecord::Migration
  def up
    remove_column :events, :hash
    remove_column :people, :hash
    add_column :events, :hash_resource, :string
    add_column :applications, :hash_resource, :string
    add_column :people, :hash_resource, :string

  end

  def down
  end
end
