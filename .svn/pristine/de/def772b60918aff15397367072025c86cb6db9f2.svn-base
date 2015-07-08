# encoding: utf-8


threads=[]

#######################################################
############# EVENTS
#######################################################
scraper_events=ScraperEvents.new

puts "Eventos"
threads << Thread.new do
  begin
    scraper_events.scrape_spainisculture
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_events.scrape_discoveringfinland
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_events.scrape_unesco
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_events.scrape_finnbay
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_events.scrape_openeducationeuropa
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_events.scrape_visitportugal
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_events.scrape_ulisboa
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_events.scrape_uoslo
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_events.scrape_google_calendar_pt
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_events.scrape_visithungary
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_events.scrape_visitbudapest
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_events.scrape_visitbrussel
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_events.scrape_belgica_turismo
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_events.scrape_universidad_algarve
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_events.scrape_universidad_porto
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_events.scrape_globalevents
  rescue
  end
end
threads <<  Thread.new do
  begin
    scraper_events.scrape_conferencealerts_portugal
  rescue
  end
end

threads <<  Thread.new do
  begin
    scraper_events.scrape_allconferences
  rescue
  end
end
threads <<  Thread.new do
    scraper_events.scrape_worldconferencecalendar
end
threads <<  Thread.new do
  begin
    scraper_events.scrape_best
  rescue
  end
end

#######################################################
############# LECTURES
#######################################################

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

#######################################################
############# APPLICATIONS
#######################################################

puts "Applications"
scraper_applications = ScraperApplications.new

threads <<  Thread.new do
  begin
    scraper_applications.scrape_alternativeto_all
  rescue
  end
end



#######################################################
############# HARVESTERS
#######################################################

puts "Harvesters"

threads <<  Thread.new do
  begin
    widgets = HarvesterWidgets.new
    widgets.harvest_widgets
  rescue
  end
end

harverster_people_event = Harvester.new

threads <<  Thread.new do
  begin
    harverster_people_event.harvest_events
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