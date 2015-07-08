
wikipediator = Wikipediator.new

rss_feeds = [{:url_feed => "http://feeds.reuters.com/reuters/healthNews", :section => wikipediator.complex_search_it("Health")[0][:name]},
   {:url_feed => "http://feeds.reuters.com/news/artsculture", :section => wikipediator.complex_search_it("Art")[0][:name]},
   {:url_feed => "http://feeds.reuters.com/Reuters/PoliticsNews", :section => wikipediator.complex_search_it("Politics")[0][:name]},
   {:url_feed => "http://feeds.reuters.com/reuters/sportsNews", :section => wikipediator.complex_search_it("Sport")[0][:name]},
   {:url_feed => "http://feeds.reuters.com/reuters/scienceNews", :section => wikipediator.complex_search_it("Science")[0][:name]},
   {:url_feed => "http://feeds.reuters.com/reuters/technologyNews", :section => wikipediator.complex_search_it("Technology")[0][:name]},
   {:url_feed => "http://feeds.reuters.com/news/economy", :section => wikipediator.complex_search_it("Economy")[0][:name]},
   {:url_feed => "http://feeds.reuters.com/reuters/businessNews" , :section => wikipediator.complex_search_it("Business")[0][:name]}]
   
a=Scraper.new

rss_feeds.each do |rss|
   a.scrape_rss_feed(rss[:url_feed],"Report")
end
