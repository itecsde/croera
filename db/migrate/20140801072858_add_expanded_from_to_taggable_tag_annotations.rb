class AddExpandedFromToTaggableTagAnnotations < ActiveRecord::Migration
  def change
      add_column :taggable_tag_annotations, :expanded_from, :integer
  end
end
