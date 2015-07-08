class AddEventPlaces < ActiveRecord::Migration
  def up
    create_table "event_places", :force => true do |t|
      t.string "name"
      t.text "description"
    end
  end

  def down
  end
end
