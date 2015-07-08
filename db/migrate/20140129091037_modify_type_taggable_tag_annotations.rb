class ModifyTypeTaggableTagAnnotations < ActiveRecord::Migration
  def up
    rename_column :taggable_tag_annotations, :type, :type_tag
  end

  def down
  end
end
