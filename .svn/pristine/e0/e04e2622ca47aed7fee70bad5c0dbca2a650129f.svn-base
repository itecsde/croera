class ModifyContextualSettingEducationLevelAnnotation < ActiveRecord::Migration
  def up
    drop_table "contextual_setting_eduaction_level_annotations"
    create_table "contextual_setting_education_level_annotations", :force => true do |t|
      t.integer "contextual_setting_id"
      t.integer "education_level_id"
    end
  end

  def down
  end
end
