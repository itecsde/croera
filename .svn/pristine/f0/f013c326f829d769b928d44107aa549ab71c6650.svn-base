class DropNewSubjectAnnotationsAddReportSubjectAnnotations < ActiveRecord::Migration
  def up
    drop_table :new_subject_annotations
    create_table "report_subject_annotations", :force => true do |t|
      t.integer "report_id"
      t.integer "subject_id"
      t.float "weight"
    end 
  end

  def down
  end
end
