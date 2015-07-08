class CreateCourseSubjectAnnotations < ActiveRecord::Migration
  def up
    create_table "course_subject_annotations", :force => true do |t|
      t.integer "course_id"
      t.integer "subject_id"
      t.float "weight"
    end
  end

  def down
  end
end
