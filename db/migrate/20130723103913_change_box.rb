class ChangeBox < ActiveRecord::Migration
  def up
    drop_table "boxes"
    
    create_table "boxes", :force => true do |t|
      t.integer "document_id"
      t.string "document_type"
      t.string  "box_type"
      t.integer "position"
      t.integer "activity_id"
    end
  end

  def down
  end
end
