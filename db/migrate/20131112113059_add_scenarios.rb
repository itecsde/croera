class AddScenarios < ActiveRecord::Migration
  def up
      create_table "scenarios", :force => true do |t|
        t.string "name"
        t.text "description"
        t.string "owner_type"
        t.integer "owner_id"
        t.integer "creator_id"                        
        t.timestamps                
      end
      add_attachment :scenarios, :element_image
      
      Scenario.create_translation_table! :name => :string, :description => :text
  end

  def down
  end
end
