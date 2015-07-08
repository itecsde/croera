class AddColumnInfoToWikifyToDocumentaries < ActiveRecord::Migration
  def change
    add_column :documentaries, :info_to_wikify, :text 
  end
end
