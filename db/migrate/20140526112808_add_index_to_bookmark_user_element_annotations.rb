class AddIndexToBookmarkUserElementAnnotations < ActiveRecord::Migration
  def change
     add_index :bookmark_user_element_annotations, :user_id
     add_index :bookmark_user_element_annotations, [:element_id, :element_type], :name => "bookmark_element_index"     
  end
end
