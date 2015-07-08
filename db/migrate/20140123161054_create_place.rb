class CreatePlace < ActiveRecord::Migration
  def up
    create_table "places", :force => true do |t|
      t.string "name"
      t.text "description"
      t.string "address"
      t.float "latitude"
      t.float "longitude"
      t.timestamps
      t.string "scraped_from"
      t.string "url"
      t.integer "owner_id"
      t.string "owner_type"
      t.integer "creator_id"     
    end
  end

  def down
  end
end
