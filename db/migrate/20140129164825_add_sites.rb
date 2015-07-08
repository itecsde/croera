class AddSites < ActiveRecord::Migration
  def up
    drop_table "places"
    
    create_table "sites", :force => true do |t|
      t.string "name"
      t.text "description"
      t.timestamps
      t.string "address"
      t.float "latitude"
      t.float "longitude"
      t.string "scraped_from"
      t.string "url"
      t.integer "owner_id"
      t.string "owner_type"
      t.integer "creator_id"     
    end
    add_attachment :sites, :element_image
  end

  def down
  end
end
