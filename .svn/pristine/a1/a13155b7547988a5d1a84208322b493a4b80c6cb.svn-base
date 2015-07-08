class AddEducationLevels < ActiveRecord::Migration
  def up
    create_table "contextual_setting_eduaction_level_annotations", :force => true do |t|
      t.integer "contextual_setting_id"
      t.integer "education_level_id"
    end
    
    create_table "education_levels", :force => true do |t|
      t.string "name"
      t.string "sde_id"
    end
    
    EducationLevel.create_translation_table! :name => :string
    
    remove_column :contextual_settings, :education_level
    
  end

  def down
  end
end
