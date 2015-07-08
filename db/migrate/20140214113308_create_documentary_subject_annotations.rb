class CreateDocumentarySubjectAnnotations < ActiveRecord::Migration
  def up
    create_table "documentary_subject_annotations", :force => true do |t|
      t.integer "documentary_id"
      t.integer "subject_id"
      t.float "weight"
    end
  end

  def down
  end
end
