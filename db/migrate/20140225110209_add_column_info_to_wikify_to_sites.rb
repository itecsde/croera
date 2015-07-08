class AddColumnInfoToWikifyToSites < ActiveRecord::Migration
  def change
    add_column :sites, :info_to_wikify, :text
  end
end
