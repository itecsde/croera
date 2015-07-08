class CreateBlogs < ActiveRecord::Migration
  def up
    create_table "blogs", :force => true do |t|
      t.string "name"
      t.text "description"
      t.string "rss_feed"
      t.timestamps
      t.string "scraped_from"
      t.integer "owner_id"
      t.string "owner_type"
      t.integer "creator_id"
      t.string "hash_resource"     
    end
  end

  def down
  end
end
