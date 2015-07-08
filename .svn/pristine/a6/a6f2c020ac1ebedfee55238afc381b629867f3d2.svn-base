class ActivityInstance < ActiveRecord::Migration
  def up
    create_table "activity_instances", :force => true do |t|
      t.string "name"
      t.text "description"
      t.integer "activity_id"
    end  
  end

  def down
  end
end
