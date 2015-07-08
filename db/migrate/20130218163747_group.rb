class Group < ActiveRecord::Migration
  def up
    create_table "groups", :force => true do |t|
      t.string "name"
    end
    
    create_table "group_teacher_annotations", :force => true do |t|
      t.integer "group_id"
      t.integer "teacher_id"
    end
  end

  def down
  end
end
