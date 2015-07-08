class AddTranslationSite < ActiveRecord::Migration
  def up
    Site.create_translation_table! :name => :string, :description => :text, :link => :string     
  end

  def down
  end
end
