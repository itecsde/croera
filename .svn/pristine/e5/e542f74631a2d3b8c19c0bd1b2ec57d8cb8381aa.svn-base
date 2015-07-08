class CreateEventSubjectAnnotation < ActiveRecord::Migration
  def up
    create_table "event_subject_annotations", :force => true do |t|
      t.integer "event_id"
      t.integer "subject_id"
    end
  end

  def down
  end
end
