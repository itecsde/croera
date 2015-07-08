class ModifyGuide < ActiveRecord::Migration
  def up
    drop_table "guides"
    
    create_table "guides", :force => true do |t|
      t.string  "name"
      t.text    "description"
      t.integer "activity_sequence_id"
      t.integer "classroom_id"
    end

  end

  def down
  end
end
