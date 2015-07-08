class AddColumnExpandedToTaggableTagAnnotations < ActiveRecord::Migration
  def change
      add_column :taggable_tag_annotations, :expanded, :boolean          
  end
end
