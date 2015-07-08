class CreateBookSubjectAnnotations < ActiveRecord::Migration
  def up
    create_table "book_subject_annotations", :force => true do |t|
      t.integer "book_id"
      t.integer "subject_id"
      t.float "weight"
    end     
  end

  def down
  end
end
