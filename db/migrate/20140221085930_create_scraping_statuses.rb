class CreateScrapingStatuses < ActiveRecord::Migration
  def up
    create_table "scraping_statuses", :force => true do |t|
      t.integer "scrapeable_id"
      t.string "scrapeable_type"
      t.boolean "automatically_tagged"
      t.boolean "categorized"
      t.boolean "translated"
      t.boolean "geolocalized"
      t.string "geolocalized_by"      
    end
  end

  def down
  end
end
