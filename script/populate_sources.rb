

######################
### POPULATE_SOURCES
######################

# This script populate sources table with data of scrapers what have been launched on the server

scrapers_courses = []
scrapers_lectures = []
scrapers_biographies = []
scrapers_articles = []
scrapers_people = []
scrapers_sites = []
scrapers_applications = []
scrapers_lres = []
scrapers_slideshows = []
scrapers_documentaries = []
scrapers_events = []
scrapers_tripadvisor = []
scrapers_posts = []

scrapers_courses << {:name => "scrape_coursera", :source_type => "Course", :url => "https://www.coursera.org/courses"}
scrapers_courses << {:name => "scrape_edx", :source_type => "Course", :url => "https://www.edx.org"}
scrapers_courses << {:name => "scrape_mit", :source_type => "Course", :url => "http://ocw.mit.edu/courses/"}

scrapers_lectures << {:name => "scrape_ted", :source_type => "Lecture", :url => "http://www.ted.com" }
scrapers_lectures << {:name => "scrape_videolectures", :source_type => "Lecture", :url => "http://videolectures.net"}
scrapers_lectures << {:name => "scrape_khanacademy", :source_type => "Lecture", :url => "https://www.khanacademy.org/"}

scrapers_biographies << {:name => "scrape_biography", :source_type => "Biography", :url => "http://biography.com/"}

scrapers_articles  << {:name => "scrape_sciencedaily", :source_type => "Article", :url => "http://www.sciencedaily.com/"}

scrapers_people << {:name => "scrape_scholar", :source_type => "Person", :url => "http://scholar.google.es"}
scrapers_people << {:name => "scrape_linkedin", :source_type => "Person", :url => "http://www.linkedin.com"}

scrapers_sites << {:name => "scrape_spainisculture", :source_type => "Site" , :url => "https://www.spainisculture.com/" }
scrapers_sites << {:name => "scrape_unesco", :source_type => "Site" , :url => "http://whc.unesco.org"}
scrapers_tripadvisor << {:name => "scrape_tripadvisor | hungary", :source_type => "Site" , :url => "http://www.tripadvisor.co.uk/Attractions-g274881-Activities-Hungary.html"}
scrapers_tripadvisor << {:name => "scrape_tripadvisor | belgium", :source_type => "Site" , :url => "http://www.tripadvisor.co.uk/Attractions-g188634-Activities-Belgium.html"}
scrapers_tripadvisor << {:name => "scrape_tripadvisor | slovakia", :source_type => "Site" , :url => "http://www.tripadvisor.co.uk/Attractions-g274922-Activities-Slovakia.html"}
scrapers_tripadvisor << {:name => "scrape_tripadvisor | france", :source_type => "Site" , :url => "http://www.tripadvisor.co.uk/Attractions-g187070-Activities-France.html"}
scrapers_tripadvisor << {:name => "scrape_tripadvisor | norway", :source_type => "Site" , :url => "http://www.tripadvisor.co.uk/Attractions-g190455-Activities-Norway.html"}
scrapers_tripadvisor << {:name => "scrape_tripadvisor | lithuania", :source_type => "Site" , :url => "http://www.tripadvisor.co.uk/Attractions-g274947-Activities-Lithuania.html"}
scrapers_tripadvisor << {:name => "scrape_tripadvisor | portugal", :source_type => "Site" , :url => "http://www.tripadvisor.co.uk/Attractions-g189100-Activities-Portugal.html"}
scrapers_tripadvisor << {:name => "scrape_tripadvisor | spain", :source_type => "Site" , :url => "http://www.tripadvisor.co.uk/Attractions-g187427-Activities-Spain.html"}
scrapers_tripadvisor << {:name => "scrape_tripadvisor | turkey", :source_type => "Site" , :url => "http://www.tripadvisor.co.uk/Attractions-g293969-Activities-Turkey.html"}
scrapers_tripadvisor << {:name => "scrape_tripadvisor | europe", :source_type => "Site" , :url => "http://www.tripadvisor.co.uk/Attractions-g4-Activities-Europe.html"}
scrapers_tripadvisor << {:name => "scrape_tripadvisor | asia", :source_type => "Site" , :url => "http://www.tripadvisor.co.uk/Attractions-g2-Activities-Asia.html"}
scrapers_tripadvisor << {:name => "scrape_tripadvisor | africa", :source_type => "Site" , :url => "http://www.tripadvisor.co.uk/Attractions-g6-Activities-Africa.html"}
scrapers_tripadvisor << {:name => "scrape_tripadvisor | canada", :source_type => "Site" , :url => "http://www.tripadvisor.co.uk/Attractions-g153339-Activities-Canada.html"}
scrapers_tripadvisor << {:name => "scrape_tripadvisor | us", :source_type => "Site" , :url => "http://www.tripadvisor.co.uk/Attractions-g191-Activities-United_States.html"}
scrapers_tripadvisor << {:name => "scrape_tripadvisor | mexico", :source_type => "Site" , :url => "http://www.tripadvisor.co.uk/Attractions-g150768-Activities-Mexico.html"}
scrapers_tripadvisor << {:name => "scrape_tripadvisor | central america", :source_type => "Site" , :url => "http://www.tripadvisor.co.uk/Attractions-g291958-Activities-Central_America.html"}
scrapers_tripadvisor << {:name => "scrape_tripadvisor | south america", :source_type => "Site" , :url => "http://www.tripadvisor.co.uk/Attractions-g13-Activities-South_America.html"}
scrapers_tripadvisor << {:name => "scrape_tripadvisor | oceania", :source_type => "Site" , :url => "http://www.tripadvisor.co.uk/Attractions-g8-Activities-South_Pacific.html"}
scrapers_tripadvisor << {:name => "scrape_tripadvisor | antarctica", :source_type => "Site" , :url => "http://www.tripadvisor.co.uk/Attractions-g12-Activities-Antarctica.html"}
scrapers_tripadvisor << {:name => "scrape_tripadvisor | middle east", :source_type => "Site" , :url => "http://www.tripadvisor.co.uk/Attractions-g21-Activities-Middle_East.html"}

scrapers_applications << {:name => "scrape_alternativeto_all", :source_type => "Application", :url => "http://alternativeto.net"}

scrapers_lres << {:name => "scrape_lre", :source_type => "Lre" , :url => "http://lreforschools.eun.org" }

scrapers_slideshows << {:name => "scrape_slideshare", :source_type => "Slideshow" , :url => "http://www.slideshare.net" }

scrapers_documentaries << {:name => "scrape_topdocumentaryfilms", :source_type => "Documentary" , :url => "http://topdocumentaryfilms.com/"}
scrapers_documentaries << {:name => "scrape_ciberdocumentales", :source_type => "Documentary" , :url => "www.ciberdocumentales.com"}
scrapers_documentaries << {:name => "scrape_documentariosvarios", :source_type => "Documentary" , :url => "http://documentariosvarios.wordpress.com/"}
scrapers_documentaries << {:name => "scrape_documentaryaddict", :source_type => "Documentary" , :url => "http://documentaryaddict.com/"}
scrapers_documentaries << {:name => "scrape_documentaryheaven", :source_type => "Documentary" , :url => "http://documentaryheaven.com"}
scrapers_documentaries << {:name => "scrape_docunet", :source_type => "Documentary" , :url => "http://docunet.nl"}
scrapers_documentaries << {:name => "scrape_belgesell", :source_type => "Documentary" , :url => "http://www.belgesell.com"}
scrapers_documentaries << {:name => "scrape_dokumentarne", :source_type => "Documentary" , :url => "http://www.dokumentarne.sk"}
scrapers_documentaries << {:name => "scrape_magyarvagyok", :source_type => "Documentary" , :url => "http://www.magyarvagyok.com"}
scrapers_documentaries << {:name => "scrape_lrt", :source_type => "Documentary" , :url => "http://www.lrt.lt"}
scrapers_documentaries << {:name => "scrape_nrkskole", :source_type => "Documentary" , :url => "http://www.nrk.no" }
scrapers_documentaries << {:name => "scrape_docverdade", :source_type => "Documentary" , :url => "http://docverdade.blogspot.com.es"}
scrapers_documentaries << {:name => "scrape_documentairenet", :source_type => "Documentary" , :url =>"http://www.documentairenet.nl"}

scrapers_events << {:name => "scrape_spainisculture", :source_type => "Event" , :url => "http://www.spainisculture.com" }
scrapers_events << {:name => "scrape_discoveringfinland", :source_type => "Event" , :url => "http://www.discoveringfinland.com"}
scrapers_events << {:name => "scrape_unesco", :source_type => "Event" , :url => "http://www.unesco.org"}
scrapers_events << {:name => "scrape_finnbay", :source_type => "Event" , :url =>"http://www.finnbay.com"}
scrapers_events << {:name => "scrape_openeducationeuropa", :source_type => "Event" , :url => "http://www.openeducationeuropa.eu"}
scrapers_events << {:name => "scrape_visitportugal", :source_type => "Event" , :url => "www.visitportugal.com"}
scrapers_events << {:name => "scrape_ulisboa", :source_type => "Event" , :url =>"www.ulisboa.pt/home-page/media/eventos"}
scrapers_events << {:name => "scrape_uoslo", :source_type => "Event" , :url => "http://www.uio.no/english/student-life/events/?view=allupcoming"}
scrapers_events << {:name => "scrape_google_calendar_pt", :source_type => "Event" , :url => "https://www.google.com/calendar/htmlembed?src=l87bmakofdu43racqea1pch7kk@group.calendar.google.com&title=Google+Calendar&mode=AGENDA"}
scrapers_events << {:name => "scrape_visithungary", :source_type => "Event" , :url => "http://visit-hungary.com"}
scrapers_events << {:name => "scrape_visitbudapest", :source_type => "Event" , :url => "visitbudapest.travel/budapest-events/"}
scrapers_events << {:name => "scrape_visitbrussels", :source_type => "Event" , :url => "http://visitbrussels.be"}
scrapers_events << {:name => "scrape_belgica_turismo", :source_type => "Event" , :url => "http://www.belgica-turismo.es"}
scrapers_events << {:name => "scrape_universidad_algarve", :source_type => "Event" , :url => "https://www.ualg.pt"}
scrapers_events << {:name => "scrape_universidad_porto", :source_type => "Event" , :url => "http://noticias.up.pt"}
scrapers_events << {:name => "scrape_globalevents", :source_type => "Event" , :url => "http://www.globaleventslist.elsevier.com/events/eu/"}
scrapers_events << {:name => "scrape_conferencealerts_portugal", :source_type => "Event" , :url => "http://www.conferencealerts.com"}
scrapers_events << {:name => "scrape_allconferences", :source_type => "Event" , :url => "http://www.allconferences.com/"}
scrapers_events << {:name => "scrape_worldconferencecalendar", :source_type => "Event" , :url => "http://www.worldconferencecalendar.com"}
scrapers_events << {:name => "scrape_best", :source_type => "Event" , :url => "http://best.eu.org"}


post_sources_array = []
Post.all.each do |post|
  post_sources_array << {:source_type => "Post" , :url => post.scraped_from, :blog_id => post.blog_id}
end
post_sources_array = post_sources_array.uniq

post_sources_array.each do |post_source|
      puts "POST_SOURCE:"
      puts post_source
      if post_source[:blog_id] == nil
        feed_url = post_source[:url]
      else
        feed_url = Blog.find(post_source[:blog_id]).rss_feed
      end
      begin
        feed = Feedjira::Feed.fetch_and_parse(feed_url,{ :max_redirects => 3 })
        html_page = Nokogiri::HTML(open(feed_url))
        rss_feed_name = feed.title
        rss_feed_url_image = html_page.css("image url").text.strip       
      rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
      end
  scrapers_posts << {:name => rss_feed_name, :source_type => "Post" , :url => feed_url, :image_url => rss_feed_url_image}
end

scrapers = scrapers_courses + scrapers_lectures + scrapers_biographies + scrapers_articles + scrapers_people +
scrapers_sites + scrapers_applications + scrapers_lres + scrapers_slideshows + scrapers_documentaries + 
scrapers_events + scrapers_tripadvisor + scrapers_posts

scrapers.each do |scraper|
  if Source.find_by_name_and_source_type(scraper[:name],scraper[:source_type]) == nil
    #puts "Populating source: " + scraper[:name]
    source = Source.new
    source.name = scraper[:name]
    source.source_type = scraper[:source_type]
    source.number_of_resources = scraper[:source_type].constantize.where(:scraped_from => scraper[:url]).size
    source.url = scraper[:url]
    if scraper[:image_url] != nil
      begin          
        source.element_image = URI.parse(scraper[:image_url])
      rescue
      end
    end
    source.last_scraping = Time.now 
    source.last_tagged = Time.now
    source.last_categorize = Time.now
    source.scraped_correct = true
    source.tagged_correct = true
    source.categorized_correct = false
    source.scrape_status = "finished"
    source.save
  end
end


puts "Sources table was populated correctly"
