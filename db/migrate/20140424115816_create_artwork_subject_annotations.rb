class CreateArtworkSubjectAnnotations < ActiveRecord::Migration
  def up
    create_table "artwork_subject_annotations", :force => true do |t|
      t.integer "artwork_id"
      t.integer "subject_id"
      t.float "weight"
    end      
  end

  def down
  end
end
