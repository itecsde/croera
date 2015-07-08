class AddColumnInfoToWikifyToPeople < ActiveRecord::Migration
  def change
    add_column :people, :info_to_wikify, :text      
  end
end
