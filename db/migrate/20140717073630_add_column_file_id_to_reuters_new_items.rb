class AddColumnFileIdToReutersNewItems < ActiveRecord::Migration
  def change
    add_column :reuters_new_items, :file_id, :integer      
  end
end
