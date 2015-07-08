class Teacher < ActiveRecord::Migration
  def up
    create_table "teachers", :force => true do |t|
      t.string "name"
    end
    
    remove_column :comments, :user_id
    add_column :comments, :teacher_id, :integer
  end

  def down
  end
end
