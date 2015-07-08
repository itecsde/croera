class AddCourses < ActiveRecord::Migration
  def up
     create_table "courses", :force => true do |t|
      t.string "name"
      t.text "description"
      t.timestamps
      t.string "url"
      t.string "scraped_from"
      t.integer "owner_id"
      t.string "owner_type"
      t.integer "creator_id"     
    end
    add_attachment :courses, :element_image
  end

  def down
  end
end
