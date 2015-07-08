class AddTranslationCourse < ActiveRecord::Migration
  def up
    Course.create_translation_table! :name => :string, :description => :text, :link => :string  
  end

  def down
  end
end
