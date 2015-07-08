class ModifyColumnFileIdToReutersNewItem < ActiveRecord::Migration
  def up
    remove_column :reuters_new_items, :file_id
    add_column :reuters_new_items, :file_id, :string     
  end

  def down
  end
end
