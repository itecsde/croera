class CreateSlideshowSubjectAnnotations < ActiveRecord::Migration
  def up
     create_table "slideshow_subject_annotations", :force => true do |t|
      t.integer "slideshow_id"
      t.integer "subject_id"
      t.float "weight"
    end
  end

  def down
  end
end
