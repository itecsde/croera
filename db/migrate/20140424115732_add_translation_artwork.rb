class AddTranslationArtwork < ActiveRecord::Migration
  def up
    Artwork.create_translation_table! :name => :string, :description => :text, :link => :string, :raw_html => :text      
  end
  def down
  end
end
