class ScrapingStatus < ActiveRecord::Base  
  belongs_to :scrapeable, :polymorphic => :true
  attr_accessible :element_id, :element_type, :automatically_tagged, :categorized, :translated,:geolocalized,:geolocalized_by,:translated_by_wikipedia
end