class AddColumnCentroidBasedWeightToTaggableTagAnnotations < ActiveRecord::Migration
  def change
    add_column :taggable_tag_annotations, :centroid_based_weight, :float     
  end
end
