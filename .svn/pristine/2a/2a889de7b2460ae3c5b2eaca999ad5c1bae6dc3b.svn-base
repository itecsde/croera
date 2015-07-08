class AddPinnableElementToBoard < ActiveRecord::Migration
  def change
    create_table "board_element_annotations", :force => true do |t|
      t.integer "board_id"
      t.string  "board_element_type"
      t.string  "board_element_id"
    end
  end
end
