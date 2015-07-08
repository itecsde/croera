class CreateBiographySubjectAnnotations < ActiveRecord::Migration
  def up
    create_table "biography_subject_annotations", :force => true do |t|
      t.integer "biography_id"
      t.integer "subject_id"
      t.float "weight"
    end    
  end

  def down
  end
end
