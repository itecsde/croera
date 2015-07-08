class ModifyContextualSetting < ActiveRecord::Migration
  def up
    drop_table "contextual_settings"
    
    create_table "contextual_settings", :force => true do |t|
      t.string "name"
      t.text "description"
      t.string "audience"
      t.string "date_range"
      t.string "subjects"
      t.string "localisation"
    end
  end

  def down
  end
end
