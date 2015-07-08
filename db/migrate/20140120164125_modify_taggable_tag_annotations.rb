class ModifyTaggableTagAnnotations < ActiveRecord::Migration
  def up
    add_column :taggable_tag_annotations, :weight, :float
    add_column :taggable_tag_annotations, :type, :string
  end

  def down
  end
end
