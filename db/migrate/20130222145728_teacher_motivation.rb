class TeacherMotivation < ActiveRecord::Migration
  def up
    create_table "activity_teacher_motivation_annotation", :force => true do |t|
      t.integer "activity_id"
      t.integer "teacher_motivation_id"
    end
    
    create_table "teacher_motivation", :force => true do |t|
      t.string "name"
    end
  end

  def down
  end
end
