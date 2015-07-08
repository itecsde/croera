class AddClassroom < ActiveRecord::Migration
  def up
    create_table "classrooms", :force => true do |t|
    end
    
    drop_table "guides"
    
    create_table "guides", :force => true do |t|
      t.string  "name"
      t.text    "description"
      t.integer "abstract_activity_id"
      t.string  "abstract_activity_type"
      t.integer "classroom_id"
    end    
  end

  def down
  end
end
