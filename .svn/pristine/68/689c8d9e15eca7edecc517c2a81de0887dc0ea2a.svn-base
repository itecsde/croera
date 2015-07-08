class AddLres < ActiveRecord::Migration
  def up
    create_table "lres", :force => true do |t|
      t.string "name"
      t.text "description"
      t.timestamps
      t.string "url"
      t.string "scraped_from"
      t.integer "owner_id"
      t.string "owner_type"
      t.integer "creator_id"
      t.string "hash_resource"
      t.text "info_to_wikify"     
    end
    add_attachment :lres, :element_image
  end

  def down
  end
end
