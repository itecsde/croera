class AddColumnInfoToWikifyToEvents < ActiveRecord::Migration
  def change
    add_column :events, :info_to_wikify, :text     
  end
end
