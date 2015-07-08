class CreateLectureSubjectAnnotations < ActiveRecord::Migration
  def up
    create_table "lecture_subject_annotations", :force => true do |t|
      t.integer "lecture_id"
      t.integer "subject_id"
      t.float "weight"
    end
  end

  def down
  end
end
