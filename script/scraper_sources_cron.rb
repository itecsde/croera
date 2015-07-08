
scraper = Scraper.new
#scraper_events = ScraperEvents.new

sources = []
sources = sources + Source.where(:source_type => "Report")
sources = sources + Source.where(:source_type => "Post")
sources = sources + Source.where(:source_type => "Article")
#sources = sources + Source.where(:source_type => "Event")

sources.each do |source|
  begin
    #Thread.new do
      #if source.source_type == "Event"
      #  scraper_events.send(source.name)
      #else
        if !source.name.include? "scrape_"
          puts source.name 
          scraper.scrape_rss_feed(source.url,source.source_type)
          puts "Fin scrape_rss_feed"
        end
      #end
    #end
  rescue
  end
end

