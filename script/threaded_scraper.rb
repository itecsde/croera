

#######################################################
############# EVENTS
#######################################################
puts "Eventos"
e1 = Thread.new do
    scraper_events1=ScraperEvents.new
    scraper_events1.scrape_spainisculture
end
e2 = Thread.new do
    scraper_events2=ScraperEvents.new
    scraper_events2.scrape_discoveringfinland
end
e3 = Thread.new do
    scraper_events3=ScraperEvents.new
    scraper_events3.scrape_unesco
end
e4 = Thread.new do
    scraper_events4=ScraperEvents.new
    scraper_events4.scrape_finnbay
end
e5 = Thread.new do
    scraper_events5=ScraperEvents.new
    scraper_events5.scrape_openeducationeuropa
end
e6 = Thread.new do
    scraper_events6=ScraperEvents.new
    scraper_events6.scrape_visitportugal
end
e7 = Thread.new do
    scraper_events7=ScraperEvents.new
    scraper_events7.scrape_ulisboa
end
e8 = Thread.new do
    scraper_events8=ScraperEvents.new
    scraper_events8.scrape_uoslo
end
e9 = Thread.new do
    scraper_events9=ScraperEvents.new
    scraper_events9.scrape_google_calendar_pt
end
e10 = Thread.new do
    scraper_events10=ScraperEvents.new
    scraper_events10.scrape_visithungary
end
e11= Thread.new do
    scraper_events11=ScraperEvents.new
    scraper_events11.scrape_visitbudapest
end
e12 = Thread.new do
    scraper_events12=ScraperEvents.new
    scraper_events12.scrape_visitbrussel
end
e13 = Thread.new do
    scraper_events13=ScraperEvents.new
    scraper_events13.scrape_belgica_turismo
end
e14 = Thread.new do
    scraper_events14=ScraperEvents.new
    scraper_events14.scrape_universidad_algarve
end
e15 = Thread.new do
    scraper_events15=ScraperEvents.new
    scraper_events15.scrape_universidad_porto
end
e16 = Thread.new do
    scraper_events16=ScraperEvents.new
    scraper_events16.scrape_globalevents
end
e17 = Thread.new do
    scraper_events17=ScraperEvents.new
    scraper_events17.scrape_conferencealerts_portugal
end
e18 = Thread.new do
    scraper_events18=ScraperEvents.new
    scraper_events18.scrape_european_commission
end
e19 = Thread.new do
    scraper_events19=ScraperEvents.new
    scraper_events19.scrape_allconferences
end
e20 = Thread.new do
    scraper_events20=ScraperEvents.new
    scraper_events20.scrape_worldconferencecalendar
end
e21 = Thread.new do
    scraper_events21=ScraperEvents.new
    scraper_events21.scrape_best
end

#######################################################
############# LECTURES
#######################################################
puts "Lectures"
l1 = Thread.new do
  scraper_lectures1 = ScraperLectures.new
  scraper_lectures1.scrape_ted
end
l2 = Thread.new do
  scraper_lectures2 = ScraperLectures.new
  scraper_lectures2.scrape_videolectures
end
l3 = Thread.new do
  scraper_lectures3 = ScraperLectures.new
  scraper_lectures4.scrape_khanacademy
end

#######################################################
############# SITES
#######################################################
puts "Sites"
s1 = Thread.new do
  scraper_sites1 = ScraperSites.new
  scraper_sites1.scrape_spainisculture
end
s2 = Thread.new do
  scraper_sites2 = ScraperSites.new
  scraper_sites2.scrape_unesco
end
s3 = Thread.new do
  scraper_sites3 = ScraperSites.new
  scraper_sites3.scrape_tripadvisor("Hungary")
end
s4 = Thread.new do
  scraper_sites4 = ScraperSites.new
  scraper_sites4.scrape_tripadvisor("Belgium")
end
s5 = Thread.new do
  scraper_sites5 = ScraperSites.new
  scraper_sites5.scrape_tripadvisor("Slovakia")
end
s6 = Thread.new do
  scraper_sites6 = ScraperSites.new
  scraper_sites6.scrape_tripadvisor("Lithuania")
end
s7 = Thread.new do
  scraper_sites7 = ScraperSites.new
  scraper_sites7.scrape_tripadvisor("Turkey")
end
s8 = Thread.new do
  scraper_sites8 = ScraperSites.new
  scraper_sites8.scrape_tripadvisor("France")
end
s9 = Thread.new do
  scraper_sites9 = ScraperSites.new
  scraper_sites9.scrape_tripadvisor("Norway")
end
s10 = Thread.new do
  scraper_sites10 = ScraperSites.new
  scraper_sites10.scrape_tripadvisor("Portugal")
end
s11 = Thread.new do
  scraper_sites11 = ScraperSites.new
  scraper_sites11.scrape_tripadvisor("Spain")
end

#######################################################
############# APPLICATIONS
#######################################################

puts "Applications"
a1 = Thread.new do
  scraper_applications1 = ScraperApplications.new
  scraper_applications1.scrape_alternativeto
end
a2 = Thread.new do
  scraper_applications2 = ScraperApplications.new
  scraper_applications2.scrape_softonic
end
a3 = Thread.new do
  scraper_applications3 = ScraperApplications.new
  scraper_applications3.scrape_alternativeto_2
end

#######################################################
############# PEOPLE
#######################################################

puts "People"

p1 = Thread.new do
  scraper_people1 = ScraperPeople.new
  scraper_people1.scrape_linkedin
end
p2 = Thread.new do
  scraper_people2 = ScraperPeople.new
  scraper_people2.scrape_scholar
end

puts "Joins"
e1.join
e2.join
e3.join
e4.join
e5.join
e6.join
e7.join
e8.join
e9.join
e10.join
e11.join
e12.join
e13.join
e14.join
e15.join
e16.join
e17.join
e18.join
e19.join
e20.join
e21.join
l1.join
l2.join
l3.join
s1.join
s2.join
s3.join
s4.join
s5.join
s6.join
s7.join
s8.join
s9.join
s10.join
s11.join
a1.join
a2.join
a3.join
p1.join
p2.join