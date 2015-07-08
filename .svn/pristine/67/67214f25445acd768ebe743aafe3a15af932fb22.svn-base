class AddTranslationBook < ActiveRecord::Migration
  def up
    Book.create_translation_table! :name => :string, :description => :text, :link => :string, :raw_html => :text     
  end

  def down
  end
end
