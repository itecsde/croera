class ActivityInteraction < ActiveRecord::Migration
  def up
    create_table "activity_interaction_annotations", :force => true do |t|
      t.integer "activity_id"
      t.integer "interaction_id"
    end
    
    create_table "interactions", :force => true do |t|
      
    end
    
    Interaction.create_translation_table! :name => :string
  end

  def down
  end
end
