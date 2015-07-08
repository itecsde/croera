class AddContextualLanguage < ActiveRecord::Migration
  def up
    create_table "contextual_setting_language_annotations", :force => true do |t|
      t.integer "contextual_setting_id"
      t.integer "contextual_language_id"
    end
    
    create_table "contextual_languages", :force => true do |t|
      t.string "name"
      t.string "sde_id"
    end
    
    ContextualLanguage.create_translation_table! :name => :string
  end

  def down
  end
end
