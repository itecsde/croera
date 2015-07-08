class AddColumnInfoToWikifyToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :info_to_wikify, :text     
  end
end
