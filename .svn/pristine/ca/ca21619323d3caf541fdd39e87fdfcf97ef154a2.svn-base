class ModifyGroupUserAnnotations < ActiveRecord::Migration
  def up
    drop_table "group_person_annotations"
    drop_table "group_teacher_annotations"
    
    create_table "group_user_annotations", :force => true do |t|
        t.integer "group_id"
        t.integer "user_id"
     end
  end

  def down
  end
end
