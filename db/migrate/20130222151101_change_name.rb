class ChangeName < ActiveRecord::Migration
  def up
    drop_table "activity_teacher_motivation_annotation"
    drop_table "teacher_motivation"
    
    create_table "activity_teacher_motivation_annotations", :force => true do |t|
      t.integer "activity_id"
      t.integer "teacher_motivation_id"
    end
    
    create_table "teacher_motivations", :force => true do |t|
      t.string "name"
    end    
  end

  def down
  end
end
