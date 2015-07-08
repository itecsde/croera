class LearnerMotivation < ActiveRecord::Migration
  def up
    create_table "activity_learner_motivation_annotations", :force => true do |t|
      t.integer "activity_id"
      t.integer "learner_motivation_id"
    end

    create_table "learner_motivations", :force => true do |t|
      t.string "name"
    end
        
    
    

  end

  def down
  end
end
