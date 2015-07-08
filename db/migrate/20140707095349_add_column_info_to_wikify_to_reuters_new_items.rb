class AddColumnInfoToWikifyToReutersNewItems < ActiveRecord::Migration
  def change
    add_column :reuters_new_items, :info_to_wikify, :text       
  end
end
