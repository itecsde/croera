class AddColumnSdeSplitToReutersNewItems < ActiveRecord::Migration
  def change
    add_column :reuters_new_items, :sde_split, :string      
  end
end
