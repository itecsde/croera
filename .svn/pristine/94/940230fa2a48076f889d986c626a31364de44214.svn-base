# encoding: utf-8

threads=[]

#######################################################
############# SITES
#######################################################
puts "Sites"
scraper_sites = ScraperSites.new

threads <<  Thread.new do
  begin
    scraper_sites.scrape_tripadvisor("europe")
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_sites.scrape_tripadvisor("asia")
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_sites.scrape_tripadvisor("middle east")
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_sites.scrape_tripadvisor("africa")
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_sites.scrape_tripadvisor("canada")
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_sites.scrape_tripadvisor("us")
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_sites.scrape_tripadvisor("mexico")
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_sites.scrape_tripadvisor("central america")
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_sites.scrape_tripadvisor("south america")
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_sites.scrape_tripadvisor("oceania")
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_sites.scrape_tripadvisor("antarctica")
  rescue
  end
end



puts "Joins"

threads.each do |thread|
   thread.join
   if thread[:exception]
     # log it somehow, or even re-raise it if you
     # really want, it's got it's original backtrace.
   end
end