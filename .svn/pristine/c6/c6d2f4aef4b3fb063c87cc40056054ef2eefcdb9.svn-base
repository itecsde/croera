class AddTranslationToGroups < ActiveRecord::Migration
  def change
    change_column :groups, :description, :text
    Group.create_translation_table! :name => :string, :description => :text
  end
end
