class AddColumnInfoToWikifyToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :info_to_wikify, :text          
  end
end
