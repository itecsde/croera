class AddTranslationDocumentary < ActiveRecord::Migration
  def up
     Documentary.create_translation_table! :name => :string, :description => :text, :link => :string    
  end

  def down
  end
end
