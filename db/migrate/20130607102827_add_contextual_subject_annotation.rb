class AddContextualSubjectAnnotation < ActiveRecord::Migration
  def up
    create_table "contextual_setting_subject_annotations", :force => true do |t|
      t.integer "contextual_setting_id"
      t.integer "subject_id"
    end
  end

  def down
  end
end
