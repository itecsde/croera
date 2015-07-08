class ModifyFieldsContextualSetting < ActiveRecord::Migration
  def up
    drop_table "contextual_settings"
    
    create_table "contextual_settings", :force => true do |t|
      t.string "name"
      t.text "description"
      t.string "age_range"
      t.string "education_level"
      t.string "street_address"
      t.string "postal_code"
      t.string "locality"
      t.string "country"
      t.string "start_date"
      t.string "end_date"
      t.string "subject"
    end
  end

  def down
  end
end
