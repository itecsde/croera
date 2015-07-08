class AddScrapeStatusToSources < ActiveRecord::Migration
  def change
    add_column :sources, :scrape_status, :string    
  end
end
