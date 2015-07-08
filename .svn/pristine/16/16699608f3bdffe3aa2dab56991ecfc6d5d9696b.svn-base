class ModifyEvent < ActiveRecord::Migration
  def up
    drop_table "event"
    create_table "events", :force => true do |t|
      t.string "name"
       t.text   "description"
    end
  end

  def down
  end
end
