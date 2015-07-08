class AddTranslationsReports < ActiveRecord::Migration
  def up    
    Report.create_translation_table! :name => :string, :description => :text, :link => :string  
  end

  def down
  end
end
