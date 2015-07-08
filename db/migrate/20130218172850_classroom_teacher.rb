class ClassroomTeacher < ActiveRecord::Migration
  def up
    create_table "classroom_teacher_annotations", :force => true do |t|
      t.integer "classroom_id"
      t.integer "teacher_id"
    end
  end

  def down
  end
end
