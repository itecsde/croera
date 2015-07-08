class AddScrapedFromToSources < ActiveRecord::Migration
  def change
    add_column :sources, :scraped_from, :string
  end
end
