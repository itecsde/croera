class AddTechnicalMotivation < ActiveRecord::Migration
  def up
    create_table "activity_technical_motivation_annotations", :force => true do |t|
      t.integer "activity_id"
      t.integer "technical_motivation_id"
    end
    
    create_table "technical_motivations", :force => true do |t|
      t.string "name"
    end
  end

  def down
  end
end
