class CreateKlascementSubjectAnnotations < ActiveRecord::Migration
  def up
    create_table "klascement_subject_annotations", :force => true do |t|
      t.integer "klascement_id"
      t.integer "subject_id"
      t.float "weight"
    end      
  end

  def down
  end
end
