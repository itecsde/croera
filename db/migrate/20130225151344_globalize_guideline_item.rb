class GlobalizeGuidelineItem < ActiveRecord::Migration
  def up
    GuidelineItem.create_translation_table! :name => :string, :description => :text
    remove_column :guideline_items, :name
    remove_column :guideline_items, :description
  end

  def down
  end
end
