class ModifyTranslationImageContent < ActiveRecord::Migration
  def up
    Content.create_translation_table! :name => :string, :description => :text
    remove_column :contents, :name, :description
    add_attachment :contents, :element_image
  end

  def down
  end
end
