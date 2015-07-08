class Dropteacher < ActiveRecord::Migration
  def up
    drop_table :teachers
    remove_column :comments, :teacher_id
    add_column :comments, :user_id, :integer
  end

  def down
  end
end
