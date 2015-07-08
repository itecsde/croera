class CreateNewSubjectAnnotations < ActiveRecord::Migration
  def up
    create_table "new_subject_annotations", :force => true do |t|
      t.integer "new_id"
      t.integer "subject_id"
      t.float "weight"
    end    
  end

  def down
  end
end
