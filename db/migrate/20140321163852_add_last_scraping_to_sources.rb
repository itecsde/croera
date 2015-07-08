class AddLastScrapingToSources < ActiveRecord::Migration
  def change
    add_column :sources, :last_scraping, :datetime 
  end
end
