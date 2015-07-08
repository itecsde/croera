class AddCircumstance < ActiveRecord::Migration
  def up
    create_table "circumstance", :force => true do |t|
      t.string "name"
      t.string "description"
      t.string "address"
      t.float "longitude"
      t.float "latitude"
      t.boolean "has_internet"
      t.string "operating_system"
      t.boolean "has_interactive_whiteboard"
      t.string "educational_level"
      t.string "locale"
      t.integer "subject_id"
      t.datetime "start_date"
      t.datetime "end_date"
      t.integer "user_id"
      t.timestamps
    end
  end

  def down
  end
end
