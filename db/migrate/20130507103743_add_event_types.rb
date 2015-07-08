class AddEventTypes < ActiveRecord::Migration
  def up
    create_table "event_types", :force => true do |t|
      t.string "name"
      t.text "description"
    end
  end

  def down
  end
end
