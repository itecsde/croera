# encoding: utf-8

threads=[]

#######################################################
############# SITES
#######################################################
puts "Sites"
scraper_sites = ScraperSites.new

threads <<  Thread.new do
  begin
    scraper_sites.scrape_spainisculture
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_sites.scrape_unesco
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_sites.scrape_tripadvisor("Hungary")
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_sites.scrape_tripadvisor("Belgium")
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_sites.scrape_tripadvisor("Slovakia")
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_sites.scrape_tripadvisor("Lithuania")
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_sites.scrape_tripadvisor("Turkey")
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_sites.scrape_tripadvisor("France")
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_sites.scrape_tripadvisor("Norway")
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_sites.scrape_tripadvisor("Portugal")
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_sites.scrape_tripadvisor("Spain")
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