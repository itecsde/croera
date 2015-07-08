# encoding: utf-8

threads=[]

puts "Lectures"
scraper_lectures = ScraperLectures.new

threads <<  Thread.new do
  begin
    scraper_lectures.scrape_ted
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_lectures.scrape_videolectures
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_lectures.scrape_khanacademy
  rescue
  end
end


threads.each do |thread|
   thread.join
   if thread[:exception]
     # log it somehow, or even re-raise it if you
     # really want, it's got it's original backtrace.
   end
end