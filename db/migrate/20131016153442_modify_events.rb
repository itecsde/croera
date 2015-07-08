class ModifyEvents < ActiveRecord::Migration
  def up
    drop_table "events"
    create_table "events", :force => true do |t|
      t.string "name"
      t.text   "description"
      t.string "age_range"
      t.string "start_date"
      t.string "end_date"
      t.string "address"
      t.string "latitude"
      t.string "longitude"
    end
  end

  def down
  end
end
