# encoding: utf-8

require 'capybara/rails'
require "capybara"
require "capybara/dsl" 

class ScraperEvents
  include ActionView::Helpers::SanitizeHelper
    include Capybara::DSL
  ##########################
  #Function that check if de resource if whe need to insert new resource,
  #update existing one or do nothing because the resource is already updated
  #########################
  def check_resource_storage_state(type_resource,url,recent_hash)
    result="do_nothing"
    case type_resource
    when "event"
      event=Event.where(:url=> url)
      if event.size > 0
        puts event[0].hash_resource
        if event[0].hash_resource != recent_hash
          result="update"
        end
      else
        result="insert"
      end
    when "application"
      application=Application.where(:url=> url)
      if application.size > 0
        if application[0].hash_resource != recent_hash
          result="update"
        end
      else
        result="insert"
      end
    when "person"
      person=Application.where(:url=> url)
      if person.size > 0
        if person[0].hash_resource != recent_hash
          result="update"
        end
      else
        result="insert"
      end
    end
    return result
  end


  ##########################################################
  ##### Funtion to scrape events from www.spainisculture.com
  def scrape_spainisculture(*opcionales)
    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'
    begin
    source_name = __method__.to_s    
    #Add new source, or select it if exists
    source = Source.create_or_select_source(source_name, "Event", "http://www.spainisculture.com")
      
      if opcionales[0]==1
      reintentos = opcionales[1].to_i
      else
      reintentos = 2
      end     
      
      page = Nokogiri::HTML(open("http://www.spainisculture.com/en/categorias.html"))
      reintentos = 2
      page.css('div.categ').each do |category|
        scrape_category_spainisculture(category)
      end
      source.correct_scrape
    rescue Exception => e
      puts "Try scrape again"
      puts "Reintentamos dos veces, sino abortamos"
      puts e.backtrace.inspect
      puts e.message
      if reintentos > 0
        reintentos-=1
        sleep 2
        scrape_spainisculture(1,reintentos)
      end
      source.incorrect_scrape
    end

  end

  def scrape_category_spainisculture(category)
    puts "In scrape_category"
    begin
      page = Nokogiri::HTML(open("http://www.spainisculture.com"+category.css('a.vermas')[0]['href']+"&matchesPerPage=50"))
      page.css('div.listiteminfo').each do |event|
        scrape_event_spainisculture(event)
      end
      #Miramos si tiene mas de una pagina
      if page.css("div.pd ul li").size>0
        num_page=1
        page.css("div.pd ul li").each do |new_page|
          if num_page!=1
            begin
              puts "A"
              page2=Nokogiri::HTML(open("http://www.spainisculture.com"+new_page.css('a')[0]['href']))
              puts "B"
              page2.css('div.listiteminfo').each do |event|
              scrape_event_spainisculture(event)
              end
            rescue
              puts "Scrape_category_spainisculture failed on pagination"
            end
          end
          num_page+=1
        end
      end
    rescue
      puts "Try scrape categry again"
      #scrape_category_spainisculture(category)
    end
  end

  def scrape_event_spainisculture(event, *reintentos)
    scraped_from = "http://www.spainisculture.com"
    puts "In scrape_event"
    scraped_event = Event.new
    
    idiomas_disponibles = [:es,:fr,:en]
    name = ""
    description = ""
    begin  
      sleep 0.2
      
      if reintentos[0]==1
        reintentos = reintentos[1].to_i
      else
        reintentos = 2
      end
           
      event_url="http://www.spainisculture.com"+event.css('a')[0]['href']
  
      event_url_es = event_url.gsub("/en/","/es/")
      puts event_url_es
      page = Nokogiri::HTML(open(event_url_es))
      begin
        name_es=page.css('div.tema')[0].css('h2').text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
        puts name_es
        description_es=page.css('p.entradilla')[0].text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
        puts description_es
      rescue
        puts "Exception name-description_es spainisculture"
      end
      
      event_url_fr = event_url.gsub("/en/","/fr/")
      puts event_url_fr
      page = Nokogiri::HTML(open(event_url_fr)) 
      begin
        name_fr=page.css('div.tema')[0].css('h2').text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
        puts name_fr
        description_fr=page.css('p.entradilla')[0].text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
        puts description_fr
      rescue
        puts "Exception name-description_fr spainisculture"        
      end
      
      puts event_url
      page = Nokogiri::HTML(open(event_url))     

      latitude=nil
      longitude=nil
      address=nil
      start_date=nil
      end_date=nil
      description=""
      begin
        puts page.css('div.tema')[0].css('h2').text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
        name=page.css('div.tema')[0].css('h2').text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
        puts page.css('p.entradilla')[0].text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
        description=page.css('p.entradilla')[0].text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
      rescue
        puts "Exception name-description_en spainisculture"
      end

      ## Date Parse
      begin
        date_range=page.css('p.coltxt')[0].css("span")[0].text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
        puts date_range
        if date_range.include? " to "
          start_date=Chronic.parse(date_range.slice(0,date_range.index(" to "))).strftime('%Y-%m-%d')
          end_date=Chronic.parse(date_range.slice(date_range.index(" to "),date_range.length)).strftime('%Y-%m-%d')
        #puts start_date+" - "+end_date
        elsif Chronic.parse(date_range)!=nil
          start_date=Chronic.parse(date_range).strftime('%Y-%m-%d')
        end_date=start_date
        #puts start_date
        else
          puts "Invalid date format"
        end
      rescue
        puts "Exception in date"
      end

      #Address parse
      begin
        address=event.css('a')[0]['href'].split("/")[3].strip().gsub(/\n/," ").gsub(/\s+/,' ')
      rescue
        puts "Failed address"
      end
      #Photo parse parse
      begin
        photo_url="http://www.spainisculture.com"+page.css('div.leinteresa')[0].css('img')[0]['src']
      rescue
      end

      # Tags Parse
      begin
        human_tags=Array.new
        human_tags=page.css('p.coltxt')[0].css("span")[1].text.strip().gsub(/\n/," ").gsub(/\s+/,' ').split(',')
        category=page.css('p.coltxt')[1].css("span")[0].text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
        human_tags.push(category)
      rescue
        puts "Exception in tags spainisculture (events)"
      end
                                 
      I18n.locale = "es"
      scraped_event.name = name_es
      scraped_event.description = description_es
      scraped_event.link = event_url_es
      I18n.locale = "fr"
      scraped_event.name = name_fr
      scraped_event.description = description_fr
      scraped_event.link = event_url_fr
      I18n.locale = "en"        
      scraped_event.name=name
      scraped_event.description=description
      scraped_event.start_date=start_date
      scraped_event.end_date=end_date
      scraped_event.address=address
      scraped_event.link = event_url
      scraped_event.url=event_url
      scraped_event.scraped_from=scraped_from
      
      prosa = name + ". " + description 
      
      puts "la prosa es- " + prosa
          
      if photo_url!=nil
        begin
          a = URI.parse(photo_url)
          scraped_event.element_image=URI.parse(photo_url)
        rescue
          puts "spainisculture IMAGEN NO GUARDADA"
          scraped_event.element_image.clear
        end
      end           
      scraped_event.persist(idiomas_disponibles,prosa,human_tags)
      
      reintentos = 2

    rescue Exception => e
      puts e.backtrace.inspect
      puts e.message
      puts "Reintentamos un par de veces, sinó saltamos al siguiente"
      puts reintentos
      if reintentos > 0
        reintentos-=1
        sleep 2
        scrape_event_spainisculture(event, 1, reintentos)
      end
    end
  end

  #######################################################################################################################################################################
  ########## Funtion to scrape events from www.discoveringfinland.com
  def scrape_discoveringfinland
    source_name = __method__.to_s    
    #Add new source, or select it if exists
    source = Source.create_or_select_source(source_name, "Event", "http://www.discoveringfinland.com")    
    
    scrape_category_discoveringfinland("http://www.discoveringfinland.com/listings/whats-on/concerts-festivals/classical/index.html")
    scrape_category_discoveringfinland("http://www.discoveringfinland.com/listings/whats-on/concerts-festivals/jazz-blues/index.html")
    scrape_category_discoveringfinland("http://www.discoveringfinland.com/listings/whats-on/concerts-festivals/concert-halls/index.html")
    scrape_category_discoveringfinland("http://www.discoveringfinland.com/listings/whats-on/theatre-shows/index.html")
    scrape_category_discoveringfinland("http://www.discoveringfinland.com/listings/whats-on/exhibitions/index.html")
    scrape_category_discoveringfinland("http://www.discoveringfinland.com/listings/whats-on/kid-events/index.html")
    scrape_category_discoveringfinland("http://www.discoveringfinland.com/listings/whats-on/other-events-finland/index.html")
    scrape_category_discoveringfinland("http://www.discoveringfinland.com/listings/whats-on/filmfestivals/")
    
    source.correct_scrape
  end

  def scrape_category_discoveringfinland(url_category)
    begin
      category_page = Nokogiri::HTML(open(url_category))
      category_page.css('div.productItem').each do |item|
        url_event=item.css('h2.productItemHead')[0].css('a')[0]['href']
        scrape_event_discoveringfinland(url_event)
      end

    rescue
      puts "Try scrape_category_discoveringfinland again"
    end
  end

  def scrape_event_discoveringfinland(event_url)
    begin
      scraped_from = "http://www.discoveringfinland.com"
      puts event_url
      scraped_event = Event.new
      name = ""
      description = ""
      idiomas_disponibles = [:fi,:de,:ru,:es,:fr,:it,:en]
      event_url_locale = event_url
      event_page = ""
      idiomas_disponibles.each do |idioma|
        I18n.locale = idioma
        begin
          if idioma == :en
            event_url_locale = event_url 
          else
            event_url_locale = event_url.gsub("/product/","/" + idioma.to_s + "/product/")
          end
          #puts event_url_locale
          puts "Obteniendo información en idioma " + idioma.to_s
          event_page = Nokogiri::HTML(open(event_url_locale))
          begin
            name = event_page.css('div.listingContent')[0].css('h1')[0].text
            scraped_event.name = name
            #puts "Name: " + name
          rescue
            puts "Failed name discoveringfinland"
          end       
          begin
            description = event_page.css('div.listingDescription').text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
            scraped_event.description = description
            #puts "Description: " + description
          rescue
            puts "Failed description discoveringfinland"        
          end
          
        scraped_event.link = event_url_locale
          
        rescue Exception => e
          puts "Failed name-description-address idiomas discoveringfinland"
          puts e.message
          puts e.backtrace.inspect
        end     
      end #do |idioma|

      begin
        address = event_page.css('div.listingAddress')[0].text.strip().gsub(/\n/,", ").gsub(/\s+/,' ')
        #puts "Address: " + address
      rescue
        puts "Failed Address discoveringfinland"
      end  

      begin
        photo_url=event_page.css('img#fotoprincipal')[0]['src']
      rescue
        photo_url = nil
      end
      start_date = nil
      end_date = nil
      begin
        date_range=event_page.css('div#general > span')[0].text.strip().gsub(/\t/,"").gsub(/\s+/,' ')
        if date_range!=nil && date_range!=""
          if date_range.include? " to "
            start_date=Chronic.parse(date_range.slice(0,date_range.index(" to "))).strftime('%Y-%m-%d')
            end_date=Chronic.parse(date_range.slice(date_range.index(" to "),date_range.length)).strftime('%Y-%m-%d')
          #puts start_date+" - "+end_date
          elsif Chronic.parse(date_range)!=nil
            start_date=Chronic.parse(date_range).strftime('%Y-%m-%d')
          end_date=start_date
          #puts start_date
          else
            puts "Invalid date format"
          end
        end
      rescue
      end

      human_tags=Array.new
      begin
        event_page.css('div#path').css('a').each do |cat|
          if cat.text.strip()!="Whats On"
            human_tags.push(cat.text.strip())
          end
        end
      rescue
        puts "Exception parsing tags discoveringfinland"
      end
      
      scraped_event.address = address         
      scraped_event.start_date=start_date
      scraped_event.end_date=end_date
      scraped_event.url=event_url
      scraped_event.scraped_from=scraped_from

      prosa = name + ". " + description

      if photo_url!=nil
        begin
          a = URI.parse(photo_url)
          scraped_event.element_image=URI.parse(photo_url)
        rescue
          puts "discoveringfinland: IMAGEN NO GUARDADA"
          scraped_event.element_image.clear
        end
      end           
      scraped_event.persist(idiomas_disponibles,prosa,human_tags)

      rescue Exception => e
        puts "Try scrape_event_discoveringfinland again"
        puts e.message
        puts e.backtrace.inspect
      end
  end

  ##### Funtion to scrape events from www.unesco.org
  def scrape_unesco
    begin
      source_name = __method__.to_s    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Event", "http://www.unesco.org")   
      page = Nokogiri::HTML(open("http://www.unesco.org/new/en/unesco/events/all-events/"))
      page.css('div.nice-item').each do |item|
        url_event=item.css('a')[0]['href']
        scrape_event_unesco("http://www.unesco.org/new/" + url_event)
      end
      source.correc_scrape
    rescue
      puts "Try scrape_unesco again"
    end
  end

  def scrape_event_unesco(event_url)
    scraped_from="http://www.unesco.org"
    puts event_url
    name = ""
    description = ""
      begin
        scraped_event = Event.new        
        idiomas_disponibles = [:fr,:en]
        event_page = ""
        idiomas_disponibles.each do |idioma|
          I18n.locale = idioma
          begin
            event_url_locale = event_url.gsub("/en/","/" + idioma.to_s + "/")
            #puts event_url_locale
            puts "Obteniendo información en idioma " + idioma.to_s
            event_page = Nokogiri::HTML(open(event_url_locale))
            begin
              name=event_page.css('div.content > h4')[0].text
              scraped_event.name = name
              puts "Name: " + name
            rescue
              puts "Failed name unesco"
            end       
            begin
              description=event_page.css('div.nice-desc > p')[0].text.strip().gsub(/\n/,", ").gsub(/<br\s*\/?>/, '').gsub(/\s+/,' ')
              scraped_event.description = description
              #puts "Description: " + description
            rescue
              puts "Failed description unesco"        
            end
            
            scraped_event.link = event_url_locale
            
          rescue Exception => e
            puts "Failed name-description idiomas unesco"
            puts e.message
            puts e.backtrace.inspect
          end     
        end #do |idioma|
        
        begin
          photo_url=event_page.css('div.nice-picture > img')[0]['src']
        rescue
          puts "Failed photo unesco"
          photo_url = nil
        end

        start_date=""
        end_date=""
        country=""
        city=""
        human_tags=Array.new
        event_page.css('div.content > table')[0].css('tr').each do |row|
          case row.css('th')[0].text
          when "Type of Event"
            human_tags << row.css('td')[0].text.strip().gsub(/\n/,", ").gsub(/<br\s*\/?>/, '').gsub(/\s+/,' ')
          when "Start"
            start_date=Chronic.parse(row.css('td')[0].text).strftime('%Y-%m-%d')
          #puts start_date
          when "End"
            end_date=Chronic.parse(row.css('td')[0].text).strftime('%Y-%m-%d')
          #puts end_date
          when "Country"
            country=row.css('td')[0].text.strip().gsub(/\n/,", ").gsub(/<br\s*\/?>/, '').gsub(/\s+/,' ')
          #puts country
          when "City"
            city=row.css('td')[0].text.strip().gsub(/\n/,", ").gsub(/<br\s*\/?>/, '').gsub(/\s+/,' ')
          #puts city
          end
        end
        address=city + "," + country
  
        scraped_event.start_date=start_date
        scraped_event.end_date=end_date
        scraped_event.address=address
        scraped_event.url=event_url
        scraped_event.scraped_from=scraped_from
        
        if photo_url!=nil
          begin
            a = URI.parse(photo_url)
            scraped_event.element_image=URI.parse(photo_url)
          rescue
            puts "unesco: IMAGEN NO GUARDADA"
            scraped_event.element_image.clear
          end
        end           
        
        prosa = name + ". " + description
        scraped_event.persist(idiomas_disponibles,prosa,human_tags)

      rescue Exception => e
        puts e.backtrace.inspect
        puts e.message
        puts "Exception in scrape_event_unesco"
      end
  end

  #######################################################
  #######################################################

  def scrape_finnbay
    url="http://www.finnbay.com/events/"
    begin
      source_name = __method__.to_s    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Event", "http://www.finnbay.com")   
            
      list_page = Nokogiri::HTML(open(url))
      num_pages=list_page.css("span.em-pagination")[0].css(".page-numbers").size()-list_page.css("span.em-pagination")[0].css(".prev").size()-list_page.css("span.em-pagination")[0].css(".next").size()
      list_page.css("table.events-table")[0].css("a").each do |html_link|
        scrape_event_finnbay(html_link['href'])
      end

      (1..num_pages).each do |page|
        page_bucle = Nokogiri::HTML(open(url+"?pno="+page.to_s()))
        page_bucle.css("table.events-table")[0].css("a").each do |html_link|
          scrape_event_finnbay(html_link['href'])
        end
      end
      source.correct_scrape
    rescue
      puts "Exception in scrape_finnbay"
      source.incorrect_scrape
    end
  end

  def scrape_event_finnbay(event_url)
    puts event_url
    name = ""
    description = ""
    scraped_from = "http://www.finnbay.com"
    idiomas_disponibles = [:en]
      begin
        scraped_event = Event.new
        event_page = Nokogiri::HTML(open(event_url))
        name=event_page.css("h1.entry-title > a").text
        begin
          description=event_page.css("div.entry-content")[0].css("p")[3].text.strip().gsub(/\n/,", ").gsub(/<br\s*\/?>/, '').gsub(/\s+/,' ')
        rescue
          description=""
        end

        begin
          photo_url=event_page.css("div.entry-content")[0].css("img")[0]['src']
        rescue
          photo_url=nil
        end

        date_range= event_page.css("div.entry-content")[0].css("h3")[0].next
        date_range=date_range.text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
        #puts date_range
        if date_range.include? "-"
          start_date=Chronic.parse(date_range.slice(0,date_range.index("-"))).strftime('%Y-%m-%d')
          end_date=Chronic.parse(date_range.slice(date_range.index("-")+1,date_range.length)).strftime('%Y-%m-%d')
        elsif Chronic.parse(date_range)!=nil
          start_date=Chronic.parse(date_range).strftime('%Y-%m-%d')
        end_date=start_date
        else
          puts "Invalid date format"
          start_date=""
          end_date=""
        end

        #time=event_page.css("div.entry-content")[0].css("h3")[1].next
        location=event_page.css("div.entry-content")[0].css("h3")[2].next
        latitude= event_page.css("div.em-location-map-coords > span.lat").first.text
        longitude=event_page.css("div.em-location-map-coords > span.lng").first.text
        address=Geocoder.address(Geocoder.coordinates(latitude+","+longitude))

        I18n.locale = "en"        
        scraped_event.name = name
        scraped_event.description = description
        scraped_event.start_date = start_date
        scraped_event.end_date = end_date
        scraped_event.latitude = latitude
        scraped_event.longitude = longitude
        scraped_event.address = address
        scraped_event.url = event_url
        scraped_event.link = event_url
        scraped_event.scraped_from=scraped_from
        if photo_url!=nil
          begin
            a = URI.parse(photo_url)
            scraped_event.element_image=URI.parse(photo_url)
          rescue
            puts "finnbay IMAGEN NO GUARDADA"
            scraped_event.element_image.clear
          end
        end           
        prosa = name + ". " + description
        scraped_event.persist(idiomas_disponibles,prosa,[])

      rescue Exception => e
        puts "Exception in scrape_event_finnbay"
        puts e.message
        puts e.backtrace.inspect
      end
  end

  #######################################################
  #######################################################

  # Parsing events from openeducationeuropa (Europe learning events)
  def scrape_openeducationeuropa
    url="http://www.openeducationeuropa.eu/en/share/events?retain-filters=1&rows=50&solrsort=ds_event_date%20desc&f[0]=im_field_country_mono_mand%3A187"
    begin
      source_name = __method__.to_s    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Event", "http://www.openeducationeuropa.eu")   
            
      list_page = Nokogiri::HTML(open(url))
      list_page.css("div.search-node").css("div.search-title").each do |html|
        scrape_event_openeducationeuropa("http://www.openeducationeuropa.eu"+html.css("a")[0]["href"])
      end
      source.correct_scrape
    rescue
      puts "Exception in scrape_openeducationeuropa"
      source.incorrect_scrape
    end
  end

  def scrape_event_openeducationeuropa(event_url)
    scraped_from = "http://www.openeducationeuropa.eu"
    puts event_url
    idiomas_disponibles = [:en]
    name = ""
    description = ""
    begin
      scraped_event = Event.new
      event_page = Nokogiri::HTML(open(event_url))
      name=event_page.css("div.title_detail .pane-content")[0].text.strip().gsub(/\n/,", ").gsub(/<br\s*\/?>/, '').gsub(/\s+/,' ')
      puts name
      description=event_page.css("div.field-field-summary")[0].css("div.field-item")[0].text.strip().gsub(/\n/," ").gsub(/<br\s*\/?>/, '').gsub(/\s+/,' ')
      photo_url=event_page.css("div.logo_detail")[0].css("img")[0]['src']
      begin
        photo_url=URI.encode(photo_url)
      rescue
        photo_url=nil
      end

      start_d = event_page.css("div.field-field-dates")[0].css("span.date-display-single")[0].text
      end_d = event_page.css("div.field-field-dates")[0].css("span.date-display-single")[1].text
      start_date=Chronic.parse(start_d[start_d.index(","),start_d.length]).strftime('%Y-%m-%d')
      end_date=Chronic.parse(end_d[end_d.index(","),end_d.length]).strftime('%Y-%m-%d')
      address=nil
      latitude=nil
      longitude=nil
      begin
        address=event_page.css("div.event_address")[0]
        address.css("label").remove
        address=address.text.strip().gsub(/\n/,", ").gsub(/<br\s*\/?>/, '').gsub(/\s+/,' ')
      rescue
        puts "No address"
      end

      human_tags=Array.new
      begin
        event_page.css('div.field-field-category-1')[0].css('div.field-item').each do |cat|
          human_tags.push(cat.text.strip())
        end
      rescue
        puts "Exception parsing tags"
      end
      
      I18n.locale = "en"        
      scraped_event.name=name
      scraped_event.description=description
      scraped_event.start_date=start_date
      scraped_event.end_date=end_date
      scraped_event.address=address
      scraped_event.url=event_url
      scraped_event.link = event_url
      scraped_event.scraped_from=scraped_from
      
      if photo_url!=nil
        begin
          a = URI.parse(photo_url)
          scraped_event.element_image=URI.parse(photo_url)
        rescue
          puts "openeducationeuropa: IMAGEN NO GUARDADA"
          scraped_event.element_image.clear
        end
      end           
      prosa = name + ". " + description
      scraped_event.persist(idiomas_disponibles,prosa,human_tags)

    rescue Exception => e
      puts "Exception in scrape_event_openeducationeuropa"
      puts e.message
      puts e.backtrace.inspect
    end
  end

  ##########################################################################333
  #############################################################################
  def scrape_visitportugal
    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'
    url="http://www.visitportugal.com/en"
    begin
      source_name = __method__.to_s    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Event", "www.visitportugal.com")   
            
      i=0
      page = Nokogiri::HTML(open(url))
      page.css(".explorar-portugal-content.eventos .explorar-portugal-item").each do |item|
        puts i+=1
        scrape_event_visitportugal "http://www.visitportugal.com"+item.css(".more-btn")[0]['href']
      end
      
      siguiente = page.css("ul.pager li.pager-next a")
      
      while !siguiente.empty?
         siguiente = "http://www.visitportugal.com" + page.css("ul.pager li.pager-next a")[0]['href']
         puts siguiente
          page2=Nokogiri::HTML(open(siguiente))
          page2.css(".explorar-portugal-content.eventos .explorar-portugal-item").each do |item|
            scrape_event_visitportugal "http://www.visitportugal.com"+item.css(".more-btn")[0]['href']
        end
        siguiente = page2.css("ul.pager li.pager-next a")
      end
      source.correct_scrape
    rescue Exception => e
      puts "Exception in scrape_visit_portugal"
      puts e.message
      puts e.backtrace.inspect
      source.incorrect_scrape
    end
    
   end

  def scrape_event_visitportugal(event_url)
    begin
      name = ""
      description = ""
      puts event_url 
      scraped_event = Event.new
      idiomas_disponibles = [:es,:pt,:fr,:de,:it,:nl,:ru,:en]
      #idiomas_disponibles = ["es","pt-pt","fr","de","it","nl","ru","en"]
      event_url_locale = event_url
      event_page = ""
      idiomas_disponibles.each do |idioma|
          I18n.locale = idioma    
        begin
          if idioma == :pt
            idioma = "pt-pt"
          end
          event_url_locale = event_url.gsub("/en/","/" + idioma.to_s + "/")
          puts "Obteniendo información en idioma " + idioma.to_s
          event_page = Nokogiri::HTML(open(event_url_locale))
          begin
            name = event_page.css(".detail-header-name h1")[0].text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
            scraped_event.name = name
          rescue
            puts "Failed name visitportugal"
          end       
          begin
            description = strip_tags event_page.css(".detail-description")[0].text.strip()
            scraped_event.description = description
          rescue
            puts "Failed description visitportugal"        
          end
          
          scraped_event.link = event_url_locale
          
        rescue Exception => e
          puts "Failed name-description idiomas visitportugal"
          puts e.message
          puts e.backtrace.inspect
        end     
      end #do |idioma|
      
      begin
        address=strip_tags event_page.css(".detail-location-n-contact-item")[0].text.strip()
      rescue
        puts "Failed Address visitportugal"
      end

      begin
        photo_url=event_page.css(".detail-highlight-image img")[0]['src']
      rescue
        photo_url=nil
      end
      #puts "Photo: " + photo_url

      begin
        start_date=event_page.css(".classificacao-poi .detail-description-text")[0].text.strip()
        start_date=Chronic.parse(start_date).strftime('%Y-%m-%d')
      rescue
      end

      begin
        end_date=event_page.css(".classificacao-poi .detail-description-text")[1].text.strip()
        end_date=Chronic.parse(end_date).strftime('%Y-%m-%d')
      rescue
      end

      scraped_from = "www.visitportugal.com"
      scraped_event.address = address
      scraped_event.start_date=start_date
      scraped_event.end_date=end_date
      scraped_event.url=event_url
      scraped_event.scraped_from=scraped_from
      if photo_url!=nil
        begin
          a = URI.parse(photo_url)
          scraped_event.element_image=URI.parse(photo_url)
        rescue
          puts "visitportugal: IMAGEN NO GUARDADA"
          scraped_event.element_image.clear
        end
      end           
      prosa = name + ". " + description
      scraped_event.persist(idiomas_disponibles,prosa,[])
    
 
    rescue Exception => e
    #puts e.backtrace.inspect
    #puts e.message            # Test de excepción
    end
  end

  #############################################################################
  #                             scrape_ulisboa                                #
  #############################################################################
  
  def scrape_ulisboa
    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'
    url="http://www.ulisboa.pt/home-page/media/eventos"
   
    begin
      source_name = __method__.to_s    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Event", "www.ulisboa.pt/home-page/media/eventos")             
      page = Nokogiri::HTML(open(url))
      page.css(".wpb_wrapper.portfolio-wrap ul li figure").each do |item|
        scrape_event_ulisboa item.css(".link-to-post")[0]['href']
      end
      
   #Miramos si tiene mas de una pagina
      if page.css(".last").size>0
        puts "hay mas de una pagina en ulisboa"
        total_pag_int = Integer(page.css(".last")[0].text)
        url = "http://www.ulisboa.pt/home-page/media/eventos/page/"
        
        for i in 2..total_pag_int
          i_str = i.to_s
          puts "NUMERO::::::"
          puts i   
          page2=Nokogiri::HTML(open(url + i_str))
          page2.css(".wpb_wrapper.portfolio-wrap ul li figure").each do |item|
            scrape_event_ulisboa item.css(".link-to-post")[0]['href']
          end
        end #for
      end
      source.correct_scrape
    rescue
      puts "Exception in scrape_ulisboa"
      source.incorrect_scrape
    end   
  end

  def scrape_event_ulisboa(event_url)
    begin
      name = ""
      description = ""
      idiomas_disponibles = [:pt]
      puts"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
      scraped_event = Event.new
      latitude=nil
      longitude=nil
      address=nil
      start_date=nil
      end_date=nil
      photo_url = nil
      
      puts event_url
      event_page = Nokogiri::HTML(open(event_url))
  
      begin
        name=event_page.css(".sixteen.columns h1")[1].text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
        puts "Name: "+ name
      rescue
        puts "excepcion capturar name ulisboa"
      end

      begin
        description= strip_tags event_page.css(".wpb_wrapper.clearfix")[0].text.strip()
        #puts "Descripcion: " + description
      rescue
         puts "excepcion capturar description ulisboa"
      end
      
      begin
        photo_url=event_page.css(".media-wrap img")[0]['src']
        #puts "Photo: " + photo_url
      rescue
        begin
          photo_url=event_page.css(".wpb_wrapper .clearfix img")[0]['src']
          #puts "Photo: " + photo_url
        rescue
          puts "Excepcion capturando la foto"
          photo_url = nil
        end   
      end
      
      begin     
        for i in 0..2          
          fecha_lugar = event_page.css(".wpb_content_element.span4.wpb_text_column .wpb_wrapper.clearfix strong")[i].text.strip()  
          case fecha_lugar.strip()
          when "Data:"                    
            date=event_page.css(".wpb_content_element.span4.wpb_text_column .wpb_wrapper.clearfix strong")[i].next.text.strip()               
            if date.split(" a ").count > 1
            start_date = date.split(" a ")[0]
            longitud = start_date.length        
              if longitud <= 2
                start_date = start_date + " " + date.split(" de ")[1] + " " + date.split(" de ")[2]
              end
            elsif date.split(" e ").count > 1
              end_date = date.split(" e ")[1]
              start_date = date.split(" e ")[0] + date.split("de")[1] + date.split("de")[2]
              if start_date.split(',').count > 1
                start_date = start_date.split(',')[0] + date.split("de")[1] + date.split("de")[2]
              end
            else
              start_date = date
            end                     
            begin          
            start_date = Chronic18n.parse(start_date, :pt).strftime('%Y-%m-%d')
            #puts "Start date: " + start_date
            rescue
              puts "_start_date_ulisboa_Formato de fecha no valido"
            end
            
            begin            
              if date.split(" a ").count > 1
                end_date = date.split(" a ")[1]
              elsif date.split(" e ").count > 1
                end_date = date.split(" e ")[1]
              end
              
              if end_date != nil                
                end_date = Chronic18n.parse(end_date, :pt).strftime('%Y-%m-%d')
                #puts "End date: " + end_date
              end 
            rescue
              puts "_end_date_ulisboa_Formato de fecha no valido"  
            end
           
          when "Local:"
            address=strip_tags event_page.css(".wpb_content_element.span4.wpb_text_column .wpb_wrapper.clearfix strong")[i].next.text.strip()
            #puts "Address: " + address
          when "Local :"
            address=strip_tags event_page.css(".wpb_content_element.span4.wpb_text_column .wpb_wrapper.clearfix strong")[i].next.text.strip()
            #puts "Address: " + address         
          else    
          end    
        end #for     
      rescue
        puts "Excepcion case_scrape_event_ulisboa"
      end
  
      # por defecto ponemos coordenadas de lisboa, por si acaso campo adress vacío
      latitude = 38.730519
      longitude = -9.148579

      scraped_from = "www.ulisboa.pt/home-page/media/eventos"
      
      I18n.locale = "pt"        
      scraped_event.name=name
      scraped_event.description=description
      scraped_event.start_date=start_date
      scraped_event.end_date=end_date
      scraped_event.latitude = latitude
      scraped_event.longitude = longitude
      scraped_event.address=address
      scraped_event.url=event_url
      scraped_event.link = event_url
      scraped_event.scraped_from=scraped_from
      if photo_url!=nil
        begin
          a = URI.parse(photo_url)
          scraped_event.element_image=URI.parse(photo_url)
        rescue
          puts "ulisboa: IMAGEN NO GUARDADA"
          scraped_event.element_image.clear
        end
      end           
      prosa = name + ". " + description
      scraped_event.persist(idiomas_disponibles,prosa,[])
    rescue Exception => e  
    #puts e.backtrace.inspect
    #puts e.message            # Test de excepción
    end
  end
  
  #############################################################################
  #                             scrape_uoslo                                  #
  #############################################################################

 def scrape_uoslo
  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'
  url="http://www.uio.no/english/student-life/events/?view=allupcoming"
  begin
    source_name = __method__.to_s    
    #Add new source, or select it if exists
    source = Source.create_or_select_source(source_name, "Event", "http://www.uio.no/english/student-life/events/?view=allupcoming")              
    page = Nokogiri::HTML(open(url))
    page.css(".vrtx-resource.vevent").each do |item|
      begin
        scrape_event_uoslo item.css(".vrtx-read-more .more")[0]['href']
      rescue
        puts "Excepcion evaluando item_uoslo"
      end
    end
    
    #comprobamos si hay más páginas
    
    siguiente = page.css(".vrtx-next");
    while !siguiente.empty?()
      siguiente = page.css(".vrtx-next")[0]['href'];
      #puts "SIGUIENTE PÁGINA " + siguiente
      page2 =  Nokogiri::HTML(open(siguiente))
      page2.css(".vrtx-resource.vevent").each do |item|
        begin
          scrape_event_uoslo item.css(".vrtx-read-more .more")[0]['href']
        rescue
          puts "Excepcion evaluando item_uoslo"
        end
      end
      siguiente = page2.css(".vrtx-next");
    end
    source.correct_scrape
  rescue Exception => e
    puts e.backtrace.inspect
    puts e.message            # Test de excepción
    source.incorrect_scrape
  end
end

def scrape_event_uoslo(event_url)
    begin
      name = ""
      introduction = ""
      description = ""
      idiomas_disponibles = [:en]
      scraped_event = Event.new
      puts event_url
      event_page = Nokogiri::HTML(open(event_url))

      begin
        name=event_page.css(".vrtx-hide-additional-content-false h1")[0].text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
        puts "Name: " + name
      rescue
        name=event_page.css(".vrtx-hide-additional-content-true h1")[0].text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
        puts "Name: " + name
      end
     
      begin
        introduction= strip_tags event_page.css(".vrtx-introduction")[0].text.strip()
        #puts "INTRODUCTION: " + introduction
      rescue
      end
      
      begin
        description= strip_tags event_page.css(".vrtx-hide-additional-content-false p")[1].text.strip()
        #puts "DESCRIPTION " + description2
      rescue
        puts "Excepcion description"
      end      
      description = introduction + description      
      #puts "DESCRIPTION: " + description
      
      begin
        start_date=event_page.css(".vevent .dtstart")[0].text.strip()
        start_date=Chronic.parse(start_date).strftime('%Y-%m-%d')
        #puts "Start_date: " + start_date
      rescue
         puts "Excepcion start_date uoslo"
      end
      
      begin
        end_date=event_page.css(".vevent .dtend")[0].text.strip()
        end_date=Chronic.parse(end_date).strftime('%Y-%m-%d')
        #puts "end_date: " + end_date
      rescue
        puts "Excepcion end_date uoslo"
      end
      
      begin
        address=strip_tags event_page.css(".vevent .location")[0].text.strip()
        #puts "Address: " + address
      rescue
        puts "Excepcion address uoslo"
      end
      
      begin
        photo_url=event_page.css(".vrtx-introduction-image img")[0]['src']
        myUri = URI.parse(event_url)
        host = myUri.host
        photo_url ="http://" + host + photo_url
        #puts "Photo_url: " + photo_url
      rescue
        photo_url=nil
      end    

      #inicializamos con las coordenadas de Oslo por si no hubiera Address
        
      latitude = 59.921302
      longitude = 10.753441

      scraped_from = "http://www.uio.no/english/student-life/events/?view=allupcoming"
      
      I18n.locale = "en"        
      scraped_event.name=name
      scraped_event.description=description
      scraped_event.start_date=start_date
      scraped_event.end_date=end_date
      scraped_event.latitude = latitude
      scraped_event.longitude = longitude
      scraped_event.address=address
      scraped_event.url=event_url
      scraped_event.link = event_url
      scraped_event.scraped_from=scraped_from
      if photo_url!=nil
        begin
          a = URI.parse(photo_url)
          scraped_event.element_image=URI.parse(photo_url)
        rescue
          puts "uoslo: IMAGEN NO GUARDADA"
          scraped_event.element_image.clear
        end
      end           
      prosa = name + ". " + description
      scraped_event.persist(idiomas_disponibles,prosa,[])
    rescue Exception => e
    puts e.backtrace.inspect
    puts e.message            # Test de excepción
    end
  end

  #############################################################################
  #                        scrape_google_calendar_pt                          #
  #############################################################################

 def scrape_google_calendar_pt
  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'
  require 'openssl'
  require 'net/https'
  url="https://www.google.com/calendar/htmlembed?src=l87bmakofdu43racqea1pch7kk@group.calendar.google.com&title=Google+Calendar&mode=AGENDA"
  source_name = __method__.to_s    
  #Add new source, or select it if exists
  source = Source.create_or_select_source(source_name, "Event", "https://www.google.com/calendar/htmlembed?src=l87bmakofdu43racqea1pch7kk@group.calendar.google.com&title=Google+Calendar&mode=AGENDA") 
  begin
    page = Nokogiri::HTML(open(url))
    page.css(".view-container .date-section .event").each do |item|
      scrape_event_google_calendar_pt "https://www.google.com/calendar/" + item.css(".event-link")[0]['href']
    end
    source.correct_scrape
  rescue Exception => e
    puts e.backtrace.inspect
    puts e.message
    puts "Exception in scrape_google_calendar_pt"
    source.incorrect_scrape
  end

end

def scrape_event_google_calendar_pt(event_url)
    begin
      name = ""
      description = ""
      puts event_url
      idiomas_disponibles = [:pt]
      scraped_event = Event.new
      event_page = Nokogiri::HTML(open(event_url))
      
      begin
        name=event_page.css("h3")[0].text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
        puts "Name: " + name
      rescue
        puts "Exception Name google_calendar_pt"
      end     
      
      begin
        description= strip_tags event_page.css("div")[5].text.strip()
        #puts "Description: " + description
      rescue
        puts "Excepcion description google_calendar_pt"
      end     
      
      begin
        start_date=event_page.css("table tr td")[1].text
        start_date = start_date.gsub(/\s?(lun|mar|miÃ©|mie|mié|jue|vie|sáb|sÃ¡b|sab|dom)\s/,"")
        trozos_start_date=start_date.split(" de ")
        start_date = trozos_start_date[0] + "-" +trozos_start_date[1] + "-" + trozos_start_date[2]
        start_date = start_date.split(" ")[0]
                      
        start_date = start_date.gsub("ene", "january")
        start_date = start_date.gsub("feb", "february")
        start_date = start_date.gsub("mar", "march")
        start_date = start_date.gsub("abr", "april")
        start_date = start_date.gsub("may", "may")
        start_date = start_date.gsub("jun", "june")
        start_date = start_date.gsub("jul", "july")
        start_date = start_date.gsub("ago", "august")
        start_date = start_date.gsub("sep", "september")
        start_date = start_date.gsub("oct", "october")
        start_date = start_date.gsub("nov", "november")
        start_date = start_date.gsub("dic", "december")
          
        start_date = start_date.gsub("Ene", "january")
        start_date = start_date.gsub("Feb", "february")
        start_date = start_date.gsub("Mar", "march")
        start_date = start_date.gsub("Abr", "april")
        start_date = start_date.gsub("May", "may")
        start_date = start_date.gsub("Jun", "june")
        start_date = start_date.gsub("Jul", "july")
        start_date = start_date.gsub("Ago", "august")
        start_date = start_date.gsub("Sep", "september")
        start_date = start_date.gsub("Oct", "october")
        start_date = start_date.gsub("Nov", "november")
        start_date = start_date.gsub("Dic", "december")

        start_date=Chronic.parse(start_date).strftime('%Y-%m-%d')
        #puts "Start_date: " + start_date
      rescue
         puts "Excepcion start_date google_calendar_pt"
      end
      
      begin
        address=strip_tags event_page.css("table tr td")[3].text
        address = address.gsub("(mapa)", "")
        #puts "Address: " + address
      rescue
        puts "Excepcion address google_calendar_pt"
      end

      scraped_from = "https://www.google.com/calendar/htmlembed?src=l87bmakofdu43racqea1pch7kk@group.calendar.google.com&title=Google+Calendar&mode=AGENDA"
      
      I18n.locale = "pt"        
      scraped_event.name=name
      scraped_event.description=description
      scraped_event.start_date=start_date
      scraped_event.address=address
      scraped_event.url=event_url
      scraped_event.scraped_from=scraped_from
      prosa = name + ". " + description          
      scraped_event.persist(idiomas_disponibles,prosa,[])
           
    rescue Exception => e
      puts "Exception scraped_event_google_calendar_pt"
      puts e.backtrace.inspect
      puts e.message            # Test de excepción
    end
  end
  
  #############################################################################
  #                        scrape_visit_hungary                               #
  #############################################################################

 
 def scrape_visithungary
    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'
    url="http://visit-hungary.com/search-services/events?title=&zip=&district=0&date_from=&date_to=&submitbutton=Search&detailed=0&limit=10"
    w=0;
    begin
      source_name = __method__.to_s    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Event", "http://visit-hungary.com")       
      page = Nokogiri::HTML(open(url))
      page.css(".search_result_item").each do |item|
        puts w+=1
        sleep 2
        scrape_event_visithungary "http://visit-hungary.com"+item.css("strong")[0].next['href']
      end
  
      siguiente = page.css(".searchresult_next_page");
      while !siguiente.empty?()
        siguiente = siguiente[0]['href'];
        page2 =  Nokogiri::HTML(open("http://visit-hungary.com" + siguiente))
        page2.css(".search_result_item").each do |item|
          begin
            sleep 2
            scrape_event_visithungary "http://visit-hungary.com"+item.css("strong")[0].next['href']
          rescue  Exception => e
            puts "Excepcion evaluando item visithungary"
            puts e.backtrace.inspect
            puts e.message
          end
        end
        siguiente = page2.css(".searchresult_next_page");
      end
      source.correct_scrape
    rescue  Exception => e
      puts "Exception in scrape_visithungary"
      puts e.backtrace.inspect
      puts e.message
      source.incorrect_scrape
    end

end #scrape_visithungary
    
  def scrape_event_visithungary(event_url)   
    begin
      puts event_url 
      idiomas_disponibles = [:en]  
        event_page = Nokogiri::HTML(open(event_url))
        scraped_event=Event.new 
        scraped_from = "http://visit-hungary.com"
        I18n.locale = "en"
        scraped_event.url=event_url
        scraped_event.scraped_from=scraped_from
        name = ""
        description = ""
        start_date = nil
        end_date = nil
        address = nil
        
        human_tags = Array.new
         
        event_page.css("#details2 strong").each do |campo|    
          valor_campo = campo.text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
          case valor_campo
            when "Name:"
              name = campo.next.text.strip()
              puts "Name: " + name
              scraped_event.name=name  
            when "Description:"
              description = strip_tags campo.next.text.strip()
              puts "Description: " + description
              scraped_event.description=description
            when "Start of event:"
              start_date = campo.next.text.strip()
              start_date=Chronic.parse(start_date).strftime('%Y-%m-%d')
              puts "start_date: " + start_date
              scraped_event.start_date=start_date
            when "End of event:"
              end_date = campo.next.text.strip()
              end_date=Chronic.parse(end_date).strftime('%Y-%m-%d') 
              puts "end_date: " + end_date
               scraped_event.end_date=end_date
            when "Locality:"
              address = campo.next.text.strip()
              scraped_event.address=address
              puts "Address: " + address
            when "Type of event:"
              etiquetas = campo.next.text
              etiquetas = etiquetas.split(",")
              puts etiquetas
              human_tags = etiquetas
            else
          end      
        end #do |campo|
                       
        latlong = strip_tags event_page.css(".mapSpacer")[0].previous.text.strip
        latlong = latlong.split(":")[1]
        lat = strip_tags latlong.split(",")[0].strip
        long = strip_tags latlong.split(",")[1].strip
  
        trozo = lat.split("°")[0]        
        punto_card_lat = strip_tags trozo.split(" ")[0].strip       
        grados_lat = strip_tags trozo.split(" ")[1].strip       
        minutos_lat = strip_tags lat.split("°")[1].split("'")[0].strip       
        segundos_lat = strip_tags lat.split("°")[1].split("'")[1].split('"')[0].strip
                           
        latitude = (grados_lat.to_f + (minutos_lat.to_f * 1/60) + (segundos_lat.to_f * 1/60 * 1/60))   
        if (punto_card_lat == 'S' || punto_card_lat =="W")
          latitude = latitude * -1
        end
        
        trozo = long.split("°")[0]         
        punto_card_long = strip_tags trozo.split(" ")[0].strip       
        grados_long = strip_tags trozo.split(" ")[1].strip       
        minutos_long = strip_tags long.split("°")[1].split("'")[0].strip      
        segundos_long = strip_tags long.split("°")[1].split("'")[1].split('"')[0].strip
        longitude = (grados_long.to_f + (minutos_long.to_f * 1/60) + (segundos_long.to_f * 1/60 * 1/60))
           
        if (punto_card_long == 'S' || punto_card_long =="W")
          longitude = longitude * -1
        end
           
        begin
          photo_url=event_page.css(".lWOn")[0]['href']
          puts "photo url: " + photo_url
        rescue
          photo_url=nil
        end
            
        I18n.locale = "en"        
        scraped_event.name=name
        scraped_event.description=description
        scraped_event.start_date=start_date
        scraped_event.end_date=end_date
        scraped_event.latitude=latitude
        scraped_event.longitude=longitude
        scraped_event.address=address
        scraped_event.url=event_url
        scraped_event.link = event_url
        scraped_event.scraped_from=scraped_from
       
        if photo_url!=nil
          begin
            a = URI.parse(photo_url)
            scraped_event.element_image=URI.parse(photo_url)
          rescue
            puts "visithungary: IMAGEN NO GUARDADA"
            scraped_event.element_image.clear
          end
        end  
        prosa = name + ". " + description         
        scraped_event.persist(idiomas_disponibles,prosa,human_tags)
    
    rescue Exception => e
    puts "Exception scrape_event_visithungary"
    puts e.backtrace.inspect
    puts e.message
    end
  end #scaper_events_visithungary


  #############################################################################
  #                        scrape_visit_budapest                              #
  #############################################################################

  
 def scrape_visitbudapest
  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'
  url="http://visitbudapest.travel/budapest-events/"
  begin
    source_name = __method__.to_s    
    #Add new source, or select it if exists
    source = Source.create_or_select_source(source_name, "Event", "visitbudapest.travel/budapest-events/")    
         
    page = Nokogiri::HTML(open(url))
    page.css(".bizresult").each do |item|
      sleep 3
      scrape_event_visitbudapest "http://visitbudapest.travel" + item.css(".bizdetails h3 a")[0]['href']
    end
    source.correct_scrape
  rescue  Exception => e
    puts "Exception in scrape_visitbudapest"
    puts e.backtrace.inspect
    puts e.message
    source.incorrec_scrape
  end
end #scrape_visitbudapest


def scrape_event_visitbudapest(event_url)
    begin
      name = ""
      description = ""
      idiomas_disponibles = [:en]
      puts event_url
      latitude = nil
      longitude = nil
      event_page = Nokogiri::HTML(open(event_url))
      scraped_event=Event.new

      begin
        name=event_page.css("#content-area h1")[0].text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
        puts "Name: " + name
      rescue
      end

      begin
        description= strip_tags event_page.css(".entry")[0].text.strip()
        #puts "Description: " + description
      rescue
      end

      begin
        photo_url=event_page.css(".img_wrap.img_half.bgbe img")[0]['src']
        photo_url = photo_url.gsub("__small","")
        #puts "Photo_url: " + photo_url
      rescue
        photo_url=nil
      end
      
      begin
        date=event_page.css("#profile-data ul")[1].css("li br")[0].previous.text.strip()
        start_date = date.split("-")[0]
        start_date = start_date.gsub(" "," ").strip
        start_date=Chronic.parse(start_date).strftime('%Y-%m-%d')
        #puts "start_date: " + start_date      
        end_date = date.split("-")[1]
        end_date = end_date.gsub(" "," ").strip
        end_date=Chronic.parse(end_date).strftime('%Y-%m-%d')
        #puts "end_date: " + end_date
      rescue
        puts "Failed Data visitbudapest"
      end

      begin
        address=strip_tags event_page.css("#profile-data p")[2].text.strip()
        address = address.gsub("Venue:","")
        puts "Address: " + address
      rescue
      end

      begin           
        ii=0          
        event_page.css("#details p span").each do |item|  
          if item.text.strip == "GPS:"        
            latitude = event_page.css("#details p")[ii].css("br")[0].next.text.strip
            latitude = latitude.gsub("Lat: ","").to_f        
            longitude = event_page.css("#details p")[ii].css("br")[1].next.text.strip
            longitude = longitude.gsub("Long: ","").to_f
            scraped_event.latitude=latitude
            scraped_event.longitude=longitude
            puts latitude
            puts longitude
          end
        ii+=1
        end
      rescue
        puts "Failed geolocation visitbudapest"
      end

      begin
        human_tags = event_page.css("#profile-data p span")[0].next.text.strip()
        human_tags = human_tags.split(",")    
      rescue
        puts "Failed tags visitbudapest"
      end

      scraped_from = "visitbudapest.travel/budapest-events/"
      
      I18n.locale = "en"        
      scraped_event.name=name
      scraped_event.description=description
      scraped_event.start_date=start_date
      scraped_event.end_date=end_date
      scraped_event.latitude=latitude
      scraped_event.longitude=longitude
      scraped_event.address=address
      scraped_event.url=event_url
      scraped_event.link = event_url
      scraped_event.scraped_from=scraped_from
      
      if photo_url!=nil
        begin
          a = URI.parse(photo_url)
          scraped_event.element_image=URI.parse(photo_url)
        rescue
          puts "visitbudapest: IMAGEN NO GUARDADA"
          scraped_event.element_image.clear
        end
      end           
      prosa = name + ". " + description
      scraped_event.persist(idiomas_disponibles,prosa,human_tags)
      


    rescue Exception => e
    #puts e.backtrace.inspect
    #puts e.message            # Test de excepción
    end
  end #scrape_event_visitbudapest
  
  
  #############################################################################
  #                        scrape_visit_brussels                              #
  #############################################################################
   
   def scrape_visitbrussels

    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'
    url="http://visitbrussels.be/bitc/BE_en/do-see/to-see/cultural-agenda.do?page=1#content_main"
    
    begin
      source_name = __method__.to_s    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Event", "http://visitbrussels.be")   
      
      page = Nokogiri::HTML(open(url))
      page.css(".vevent").each do |item|
        scrape_event_visitbrussels "http://visitbrussels.be" + item.css(".url.summary")[0]['href']
      end

      siguiente = page.css(".arrow_right")[0]['href'];
      while siguiente != nil
        page2 =  Nokogiri::HTML(open("http://visitbrussels.be" + siguiente))
        page2.css(".vevent").each do |item|
          begin
            scrape_event_visitbrussels "http://visitbrussels.be" + item.css(".url.summary")[0]['href']
          rescue  Exception => e
            puts "Excepcion evaluando item visitbrussels"
            puts e.backtrace.inspect
            puts e.message
          end
        end
        siguiente = page2.css(".arrow_right")[0]['href'];
      end
      source.correct_scrape
    rescue  Exception => e
      puts "Exception in scrape_visitbrussels"
      puts e.backtrace.inspect
      puts e.message
      source.incorrect_scrape
    end
  end #scrape_visitbrussels


def scrape_event_visitbrussels(event_url)
    begin
      name = ""
      description = ""
      puts event_url
      scraped_event=Event.new   
      event_page = ""      
      urls_idiomas_disponibles = Array.new
      
      event_page = Nokogiri::HTML(open(event_url))
      
      event_page.css("div#box_btn_lg a.btn_lang").each_with_index do |idioma, index|
        urls_idiomas_disponibles << "http://visitbrussels.be" + idioma['href']
        if index==1
          break
        end
      end
      
      urls_idiomas_disponibles << event_url
      idiomas_disponibles = Array.new
      urls_idiomas_disponibles.each do |event_url_locale|
        if event_url_locale.include? "BE_fr"
          I18n.locale = "fr"
          idiomas_disponibles << I18n.locale 
        elsif event_url_locale.include? "BE_nl"
          I18n.locale = "nl"
          idiomas_disponibles << I18n.locale
        elsif event_url_locale.include? "BE_en"
          I18n.locale = "en"
          idiomas_disponibles << I18n.locale
        end       
        begin
          #puts event_url_locale
          puts "Obteniendo información en idioma " + I18n.locale.to_s
          event_page = Nokogiri::HTML(open(event_url_locale))
          begin
            name=event_page.css("h1.no_margin")[0].text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
            scraped_event.name = name
            #puts "Name: " + name
          rescue
            puts "Failed name visitbrussels"
          end       
          begin
            description= strip_tags event_page.css(".description").text.strip()
            scraped_event.description = description
            #puts "Description: " + description
          rescue
            puts "Failed description visitbrussels"        
          end
          
          scraped_event.link = event_url_locale
          
        rescue Exception => e
          puts "Failed name-description-address idiomas visitbrussels"
          puts e.message
          puts e.backtrace.inspect
        end     
      end #do |idioma|
          
      I18n.locale = "en"    
           
       begin
        address=event_page.css(".street-address").text + "," + event_page.css(".postal-code").text + "," + event_page.css(".locality").text
        if address.length == 2
          if event_page.css(".fn").text !=""
          address= event_page.css(".fn").text.split("/")[0] + " , Brussels"
          else
            address = "Brussels"
          end
        end
        #puts "Address: " + address
      rescue
        puts "Failed Address visitbrussels"
      end
          
      begin
        start_date=event_page.css("span.dtstart").text.strip()
        start_date=Chronic.parse(start_date).strftime('%Y-%m-%d')
        #puts "start_date: " + start_date
        end_date=event_page.css("span.dtend").text.strip()
        end_date=Chronic.parse(end_date).strftime('%Y-%m-%d')
        #puts "end_date: " + end_date
      rescue
        puts "Failed Data visitbrussels"
      end

      begin
        photo_url="http://visitbrussels.be" + event_page.css("img.m22")[0]['src']      
        #puts "Photo_url: " + photo_url
      rescue
        puts "Failed Photo visitbrussels"
        photo_url=nil
      end

      scraped_from = "http://visitbrussels.be"    
      scraped_event.start_date=start_date
      scraped_event.end_date=end_date
      scraped_event.address = address      
      scraped_event.url=event_url
      scraped_event.scraped_from=scraped_from
      if photo_url!=nil
        begin
          a = URI.parse(photo_url)
          scraped_event.element_image=URI.parse(photo_url)
        rescue
          puts "visitbrussels: IMAGEN NO GUARDADA"
          scraped_event.element_image.clear
        end
      end           
      prosa = name + ". " + description
      scraped_event.persist(idiomas_disponibles,prosa,[])
    rescue Exception => e
    #puts e.backtrace.inspect
    #puts e.message            # Test de excepción
    end
  end #scrape_event_visitbrussels


  #############################################################################
  #                        scrape_belgica_turismo                             #
  #############################################################################
  
 def scrape_belgica_turismo

    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'
    url="http://www.belgica-turismo.es/contenus/agenda_de_bruselas/es/4795.html????&firstrow=0"
    begin
      source_name = __method__.to_s    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Event", "http://www.belgica-turismo.es")   
            
      k=0
      page = Nokogiri::HTML(open(url))
      page.css("table")[2].css("tr").each do |item|
        if k.even?
          date=page.css("tr td h4 strong")[0].text.strip()
          scrape_event_belgica_turismo "http://www.belgica-turismo.es" + item.css("td a")[0]['href'] , date
        end
        k+=1
      end
      
      siguiente = page.css("form#fullsearch2 div a[title='página siguiente']")[0]['href'];
      while siguiente != nil
        puts "URL SIGUIENTE: " + siguiente
        k=0
        page2 =  Nokogiri::HTML(open("http://www.belgica-turismo.es" + siguiente))

        page2.css("table")[2].css("tr").each do |item|
          begin
            if k.even?
              date=page2.css("tr td h4 strong")[0].text.strip()
              scrape_event_belgica_turismo "http://www.belgica-turismo.es" + item.css("td a")[0]['href'] , date
            end
            k+=1
            siguiente = page2.css("form#fullsearch2 div a[title='página siguiente']")[0]['href']
          rescue
            puts "Excepcion evaluando siguiente pagina belgica_turismo"
            siguiente = nil
          end
        end
      end
      source.correct_scrape
    rescue  Exception => e
      puts "Exception in scrape_belgica_turismo"
      puts e.backtrace.inspect
      puts e.message
      source.incorrect_scrape
    end
  end #scrape_belgica_turismo


  def scrape_event_belgica_turismo(event_url , date)
    begin
      puts event_url
      name = ""
      description = ""
      scraped_event=Event.new      
      urls_idiomas_disponibles = ["http://www.belgien-tourismus.de",
        "http://www.belgique-tourisme.fr",
        "http://www.belgioturismo.it",
        "http://www.belgie-toerisme.nl",
        "http://www.belgica-turismo.es"]
        idiomas_disponibles = Array.new
      event_page = ""
      urls_idiomas_disponibles.each do |url_idioma|
        if url_idioma ==  "http://www.belgien-tourismus.de"
          I18n.locale = "de"
          idiomas_disponibles << I18n.locale 
        elsif url_idioma ==  "http://www.belgique-tourisme.fr"
          I18n.locale = "fr"
          idiomas_disponibles << I18n.locale
        elsif url_idioma ==  "http://www.belgioturismo.it"
          I18n.locale = "it"
          idiomas_disponibles << I18n.locale
        elsif url_idioma ==  "http://www.belgie-toerisme.nl"
          I18n.locale = "nl"
          idiomas_disponibles << I18n.locale
        elsif url_idioma ==  "http://www.belgica-turismo.es"
          I18n.locale = "es"
          idiomas_disponibles << I18n.locale
        end

        begin
          event_url_locale = event_url.gsub("http://www.belgica-turismo.es",url_idioma)
          #puts event_url_locale
          puts "Obteniendo información en idioma " + I18n.locale.to_s
          event_page = Nokogiri::HTML(open(event_url_locale))
          begin
            name=event_page.css("h1.titre_descriptif").text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
            scraped_event.name = name
            #puts "Name: " + name
          rescue
            puts "Failed name belgica_turismo"
          end       
          begin
            description= strip_tags event_page.css("#DescriptiveText")[1].text.strip()
            scraped_event.description = description
            #puts "Description: " + description
          rescue
            puts "Failed description belgica_turismo"        
          end
          
          scraped_event.link = event_url_locale
          
        rescue Exception => e
          puts "Failed name-description-address idiomas belgica_turismo"
          puts e.message
          puts e.backtrace.inspect
        end     
      end #do |idioma|
            
      
      begin     
        human_tags = event_page.css("#DescriptiveText strong.titre_rubrique span").text.strip()          
        human_tags = human_tags.split(":")
      rescue
        puts "Failed tags belgica_turismo"
      end

      begin
        photo_url = event_page.css("div#content-item div div div.DescriptiveLeft center div")[0].css("img")[0]['src']
        photo_url = photo_url.gsub("elto","elto_big")
        #puts "PHOTO URL: "+photo_url
      rescue
        puts "Failed Photo belgica_turismo"
        photo_url = nil
      end
      
      begin
        if event_page.css("div.DescriptiveLeft ul li span span span span span[property='v:street-address']").text.strip!= ""
          street= event_page.css("div.DescriptiveLeft ul li span span span span span[property='v:street-address']").text.strip+", "
        else 
          street=""
        end
        
        if event_page.css("div.DescriptiveLeft ul li span span span span span[property='v:postal-code']").text.strip!= ""
          postal= event_page.css("div.DescriptiveLeft ul li span span span span span[property='v:postal-code']").text.strip+", "
        else 
          postal=""
        end
        
        if event_page.css("div.DescriptiveLeft ul li span span span span span[property='v:locality']").text.strip!= ""
          locality= event_page.css("div.DescriptiveLeft ul li span span span span span[property='v:locality']").text.strip+", "
        else 
          locality="Brussels,"
        end
        
        if event_page.css("div.DescriptiveLeft ul li span span span span span[property='v:country-name']").text.strip!= ""
          country = event_page.css("div.DescriptiveLeft ul li span span span span span[property='v:country-name']").text.strip
        else
          country="Belgium"
        end
        address=street+postal+locality+country
        #puts "Address: " + address
      rescue
        puts "Failed Address belgica_turismo"
      end


      begin
        start_date=date.split('>')[0].strip
        start_date = Chronic18n.parse(start_date, :es).strftime('%Y-%m-%d')
        #puts "start_date: " + start_date
        end_date=date.split('>')[1].strip
        end_date=Chronic18n.parse(end_date, :es).strftime('%Y-%m-%d')
        #puts "end_date: " + end_date
      rescue
        puts "Failed Data belgica_turismo"
      end

      begin
        latitude=nil
        longitude=nil
        geo_url = event_page.css("div#DescriptiveText div.liens_membres_liste a img")[0]['src']
        geo_url= geo_url.split("center=")
        geo_url = geo_url[1].split(",")
        latitude = geo_url[0].to_f
        geo_url = geo_url[1].split("&")
        longitude = geo_url[0].to_f
      
        puts latitude
        puts longitude        
      rescue
        puts "Failed Geolocation belgica_turismo"
      end

      scraped_from = "http://www.belgica-turismo.es"
             
      scraped_event.start_date=start_date
      scraped_event.end_date=end_date
      scraped_event.address = address
      scraped_event.latitude=latitude
      scraped_event.longitude=longitude
      scraped_event.url=event_url
      scraped_event.scraped_from=scraped_from

      if photo_url!=nil
        begin
          a = URI.parse(photo_url)
          scraped_event.element_image=URI.parse(photo_url)
        rescue
          puts "belgica_turismo: IMAGEN NO GUARDADA"
          scraped_event.element_image.clear
        end
      end      
      prosa = name + ". " + description
      scraped_event.persist(idiomas_disponibles,prosa,human_tags)      
      
    rescue Exception => e
    puts e.backtrace.inspect
    puts e.message            # Test de excepción
    end
  end #scrape_event_belgica_turismo  


  #############################################################################
  #                        scrape_universidad_algarve                         #
  #############################################################################
  
   
 def scrape_universidad_algarve

    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'

    time = Time.new
    anho = time.year

    url="https://www.ualg.pt/home/pt/agenda/" + anho.to_s
    begin
      source_name = __method__.to_s    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Event", "https://www.ualg.pt")   
            
      page = Nokogiri::HTML(open(url))

      page.css("div.view-content div.views-row").each do |item|
        scrape_event_universidad_algarve "https://www.ualg.pt" + item.css("div.views-field span.field-content a")[0]['href']
      end
      source.correct_scrape
    rescue  Exception => e
      puts "Exception in scrape_belgica_turismo"
      puts e.backtrace.inspect
      puts e.message
      source.incorrect_scrape
    end

  end #scrape_universidad_algarve


def scrape_event_universidad_algarve(event_url)
    begin
      name = ""
      description = ""
      idiomas_disponibles = [:pt]
      puts event_url
      event_page = Nokogiri::HTML(open(event_url))
      scraped_event=Event.new
         
      begin
        name=event_page.css("h2.node-title a").text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
        puts "Name: " + name
      rescue
        puts "Failed Name universidad_algarve"
      end
      
      begin
        description= strip_tags event_page.css("div.field div.field-items div.field-item").text.strip()
        #puts "Description: " + description
      rescue
        puts "Failed Description universidad_algarve"
      end

      begin
        start_date = event_page.css("div.field-item span.date-display-start")[0]['content']
        start_date = Chronic18n.parse(start_date, :pt).strftime('%Y-%m-%d')
        #puts "start_date: " + start_date
        end_date= event_page.css("div.field-item span.date-display-end")[0]['content']
        end_date=Chronic18n.parse(end_date, :pt).strftime('%Y-%m-%d')
        #puts "end_date: " + end_date
      rescue
        puts "Failed Data universidade_algarve"
      end

      begin       
        address =  event_page.css(".field")[2].css(".field-items .field-item.even").text.strip
        address = address.gsub("-",",") + ", Portugal"
        #puts "Address: " + address      
      rescue
        puts "Failed Address universidad_algarve"
      end

      begin
        photo_url = event_page.css("div.field div.field-items div.field-item img")[0]['src']
        #puts "PHOTO URL: "+photo_url
      rescue
        puts "Failed Photo universidad_algarve"
        photo_url = nil
      end

      scraped_from = "https://www.ualg.pt"
      
      I18n.locale = "pt"        
      scraped_event.name=name
      scraped_event.description=description
      scraped_event.start_date=start_date
      scraped_event.end_date=end_date
      scraped_event.address=address
      scraped_event.url=event_url
      scraped_event.link = event_url
      scraped_event.scraped_from=scraped_from
      if photo_url!=nil
        begin
          a = URI.parse(photo_url)
          scraped_event.element_image=URI.parse(photo_url)
        rescue
          puts "universidad algarve: IMAGEN NO GUARDADA"
          scraped_event.element_image.clear
        end
      end      
      prosa = name + ". " + description
      scraped_event.persist(idiomas_disponibles,prosa,[])  

    rescue Exception => e
      puts "Exception scraped_event_universidad_algarve"
      puts e.backtrace.inspect
      puts e.message            # Test de excepción

    end

  end #scrape_event_universidad_algarve


  #############################################################################
  #                        scrape_universidad_porto                           #
  #############################################################################
  
   
def scrape_universidad_porto

    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'    
    begin  
      source_name = __method__.to_s    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Event", "http://noticias.up.pt")         
      url = "http://noticias.up.pt/noticias/" 
      page = Nokogiri::HTML(open(url))
      page.css("ul#dropmenu.menu li.menu-item").each do |item_ini|     
      url = item_ini.css("a")[0]['href']
      puts url
      categoria = url.gsub("http://noticias.up.pt/noticias/","").gsub("/","")     
      puts "categoria: " + categoria  
      fecha_tope = "2013-12-15"  
      page = Nokogiri::HTML(open(url))
      page.css("div#main div.listing div.post").each do |item|     
        begin
          start_date = page.css("div#main div.listing div.post small")[0].text.strip     
          start_date = start_date.split(",")[1] + start_date.split(",")[2] 
          start_date = start_date.split(" | ")[0].strip
          start_date = start_date.downcase        
          
          start_date = start_date.gsub("janeiro", "january")
          start_date = start_date.gsub("fevereiro", "february")
          start_date = start_date.gsub("março", "march")
          start_date = start_date.gsub("abril", "april")
          start_date = start_date.gsub("maio", "may")
          start_date = start_date.gsub("junho", "june")
          start_date = start_date.gsub("julho", "july")
          start_date = start_date.gsub("agosto", "august")
          start_date = start_date.gsub("setembro", "september")
          start_date = start_date.gsub("outubro", "october")
          start_date = start_date.gsub("novembro", "november")
          start_date = start_date.gsub("dezembro", "december") 
          start_date = start_date.gsub(" "," ")
          start_date = Chronic18n.parse(start_date, :en).strftime('%Y-%m-%d')
          #puts "start_date: " + start_date
          end_date = start_date
          #puts "end_date: " + end_date
        rescue
          puts "Failed Data universidad_porto"
        end     
      
        #como estan ordenados de forma cronológica, si un evento es mas viejo que la fecha tope hay que tomar la decision de que hacer
        #tomar ahora las decisiones oportunas, o parar ejecucion o llamar a otra funcion que escrapee la proxima categoría
  
        if start_date > fecha_tope         
          scrape_event_universidad_porto item.css(".thumb")[0]['href'], start_date , categoria
        else
          break
        end
      end       
   
      siguiente = page.css("div.navigation div#nextpage.pagenav a")[0]['href']   
      stop = 0          
                
       while siguiente != nil  
        puts "URL SIGUIENTE: " + siguiente            
        page2 =  Nokogiri::HTML(open(siguiente))
        page2.css("div#main div.listing div.post").each do |item|      
          begin
            start_date = page2.css("div#main div.listing div.post small")[0].text.strip   
            start_date = start_date.split(",")[1] + start_date.split(",")[2] 
            start_date = start_date.split(" | ")[0].strip
            start_date = start_date.downcase        
            
            start_date = start_date.gsub("janeiro", "january")
            start_date = start_date.gsub("fevereiro", "february")
            start_date = start_date.gsub("março", "march")
            start_date = start_date.gsub("abril", "april")
            start_date = start_date.gsub("maio", "may")
            start_date = start_date.gsub("junho", "june")
            start_date = start_date.gsub("julho", "july")
            start_date = start_date.gsub("agosto", "august")
            start_date = start_date.gsub("setembro", "september")
            start_date = start_date.gsub("outubro", "october")
            start_date = start_date.gsub("novembro", "november")
            start_date = start_date.gsub("dezembro", "december") 
        
            start_date = start_date.gsub(" "," ")
            start_date = Chronic18n.parse(start_date, :en).strftime('%Y-%m-%d')
            puts "start_date: " + start_date         
            end_date = start_date
            puts "end_date: " + end_date      
          rescue
            puts "Failed Data universidad_porto"
          end
    
        begin                  
          if start_date > fecha_tope           
            scrape_event_universidad_porto item.css(".thumb")[0]['href'] , start_date, categoria
          else
            stop = 1
            break
          end
        rescue  Exception => e
          puts "Excepcion evaluando item universidade_porto"        
          puts e.backtrace.inspect
          puts e.message
        end
       end
       
       if stop!=1 
         siguiente = page2.css("div.navigation div#nextpage.pagenav a")[0]['href']
       else
         siguiente=nil
       end     
     end                   
    end     
    source.correct_scrape       
    rescue  Exception => e
      puts "Exception in scrape_universidad_porto"
      puts e.backtrace.inspect
      puts e.message
      source.incorrect_scrape
    end

end #scrape_universidad_porto


def scrape_event_universidad_porto(event_url,start_date,categoria)
    begin
      name = ""
      description = ""
      idiomas_disponibles = [:pt]
      puts event_url
      event_page = Nokogiri::HTML(open(event_url))   
      scraped_event=Event.new
       
      begin
        name=event_page.css("h2.posttitle2").text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
        puts "Name: " + name
      rescue
        puts "Failed Name universidad_porto"
      end
      
      begin
        description= strip_tags event_page.css(".post .entry").text.strip()
        #puts "Description: " + description
      rescue
          puts "Failed Description universidad_porto"
      end
      
      begin
        address =  "Universidade do Porto, Porto, Portugal"
        #puts "Address: " + address
      rescue
        puts "Failed Address universidad_porto"
      end
      
      end_date = start_date
    
      #Coordenadas universidade do Porto     
      
      latitude = 41.147137
      longitude = -8.61559

      begin
        photo_url = event_page.css(".entry .wp-caption.alignleft img")[0]['src']
        #puts "PHOTO URL: "+ photo_url
      rescue
        puts "Failed Photo universidad_porto"
        photo_url = nil
      end
      
      begin     
        tags = event_page.css("div.entry div.entrymeta small").text.strip()          
        tags = tags.split(":")[1]
        tags = tags.split(",")      
        tags[tags.count] = categoria    
      rescue
        puts "Failed tags universidad_porto"
        tags = Array.new
        tags[0] = categoria
        #puts "tags: "
        #puts tags
      end

      scraped_from = "http://noticias.up.pt"
      
      I18n.locale = "pt"        
      scraped_event.name=name
      scraped_event.description=description
      scraped_event.start_date=start_date
      scraped_event.end_date=end_date
      scraped_event.address=address
      scraped_event.latitude=latitude
      scraped_event.longitude=longitude
      scraped_event.url=event_url
      scraped_event.link = event_url
      scraped_event.scraped_from=scraped_from
      
      if photo_url!=nil
        begin
          a = URI.parse(photo_url)
          scraped_event.element_image=URI.parse(photo_url)
        rescue
          puts "universidad_porto: IMAGEN NO GUARDADA"
          scraped_event.element_image.clear
        end
      end      
      prosa = name + ". " + description
      scraped_event.persist(idiomas_disponibles,prosa,tags)
      

    rescue Exception => e
      puts "Excepcion en scrape_event_universidad_porto"
      puts e.message            # Test de excepción
      puts e.backtrace.inspect
    end
  end #scrape_event_universidad_porto


  #############################################################################
  #                        scrape_globalevents                                #
  #############################################################################
   
   def scrape_globalevents

    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'

    url="http://www.globaleventslist.elsevier.com/events/eu"
    begin
      source_name = __method__.to_s    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Event", "http://www.globaleventslist.elsevier.com/events/eu/") 
            
      page = Nokogiri::HTML(open(url))

      page.css("div#container-events div.results div.result div.detail").each do |item|
        scrape_event_globalevents item.css("h3 a")[0]['href']
      end

      siguiente = page.css("div#paging-bottom.paging-status ul.paging li a.next")[0]['href']

      while siguiente != nil
        puts "URL_SIGUIENTE --> " + siguiente
        page2 =  Nokogiri::HTML(open(siguiente))
        page2.css("div#container-events div.results div.result div.detail").each do |item|
          begin
            scrape_event_globalevents item.css("h3 a")[0]['href']
          rescue  Exception => e
            puts "Excepcion evaluando item globalevents"
            puts e.backtrace.inspect
            puts e.message
          end
        end
        siguiente = page2.css("div#paging-bottom.paging-status ul.paging li a.next")[0]['href']
      end
      source.correct_scrape
    rescue  Exception => e
      puts "Exception in scrape_globalevents"
      puts e.backtrace.inspect
      puts e.message
      source.incorrect_scrape
    end

  end #scrape_globalevents


def scrape_event_globalevents(event_url)
    begin
      name = ""
      description = ""
      idiomas_disponibles = [:en]
       puts event_url
       event_page = Nokogiri::HTML(open(event_url))
       scraped_event=Event.new
       
      begin
        name=event_page.css("div#cphMainContent_pnlEventHeader.event-header h1")[0].text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
        puts "Name: " + name
      rescue
        puts "Failed Name globalevents"
      end

      begin
        start_date=event_page.css("div.details meta")[0]['content']
        start_date=Chronic.parse(start_date).strftime('%Y-%m-%d')
        #puts "start_date: " + start_date
        end_date=event_page.css("div.details meta")[1]['content']
        end_date=Chronic.parse(end_date).strftime('%Y-%m-%d')
        #puts "end_date: " + end_date
      rescue
        puts "Failed Data globalevents"
      end

      begin
        photo_url=event_page.css("a#cphMainContent_lnkEventLogo img#cphMainContent_imgEventLogo")[0]['src']      
        #puts "Photo_url: " + photo_url
      rescue
        puts "Failed Photo globalevents"
        photo_url=nil
      end

      begin
        description= strip_tags event_page.css("div.event-details div.description-panel div.description")[0].text.strip()
        #puts "Description: " + description
      rescue
        puts "Failed Description globalevents"
      end

      begin        
        city_country=event_page.css("div#cphMainContent_pnlEventHeader.event-header div.details")[1].text.strip
        venue=event_page.css("div#cphMainContent_pnlMediaPanelLeft.media-panel-left div.panel ul li")[4].text.strip      
        venue = venue.split(":")[1].strip             
        address = venue + ", " + city_country                 
        #puts "Address: " + address
      rescue
        puts "Failed Address globalevents"
      end

      begin       
        disciplina = event_page.css("div#cphMainContent_pnlMediaPanelLeft.media-panel-left div.panel ul li")[1].text.strip.split(":")[1].strip
        disciplina = disciplina.split(",")
        subdisciplina = event_page.css("div#cphMainContent_pnlMediaPanelLeft.media-panel-left div.panel ul li")[2].text.strip.split(":")[1].strip
        subdisciplina = subdisciplina.split(",")
        event_type = strip_tags event_page.css("div#cphMainContent_pnlMediaPanelLeft.media-panel-left div.panel ul li")[3].text.strip.split(":")[1].strip
        event_type = event_type.split(",")       
        tags = Array.new    
        tags = disciplina.concat(subdisciplina).concat(event_type)
      rescue
        puts "Failed tags globalevents"
      end

      scraped_from = "http://www.globaleventslist.elsevier.com/events/eu/"
      
      I18n.locale = "en"        
      scraped_event.name=name
      scraped_event.description=description
      scraped_event.start_date=start_date
      scraped_event.end_date=end_date
      scraped_event.address=address
      scraped_event.url=event_url
      scraped_event.link = event_url
      scraped_event.scraped_from=scraped_from
      
      if photo_url!=nil
        begin
          a = URI.parse(photo_url)
          scraped_event.element_image=URI.parse(photo_url)
        rescue
          puts "globalevents: IMAGEN NO GUARDADA"
          scraped_event.element_image.clear
        end
      end      
      prosa = name + ". " + description
      scraped_event.persist(idiomas_disponibles,prosa,tags) 
      
    rescue Exception => e
      puts "Exception scraped_event_globalevents"
      puts e.backtrace.inspect
      puts e.message            # Test de excepción
    end

  end #scrape_event_globalevents
  
  
  #############################################################################
  #                        scrape_conferencealerts_portugal                   #
  #############################################################################

 def scrape_conferencealerts_portugal

    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'

    url="http://www.conferencealerts.com/country-listing.php?page=1&ipp=All&country=Portugal"
    begin
      source_name = __method__.to_s    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Event", "http://www.conferencealerts.com") 
            
      page = Nokogiri::HTML(open(url))
      i=0
      page.css("span#searchName.textLeft").each do |item|
        scrape_event_conferencealerts_portugal "http://www.conferencealerts.com/" + item.css("a")[0]['href']
        i+=1
        puts i
      end
      source.correct_scrape
    rescue  Exception => e
      puts "Exception in scrape_conferencealerts_portugal"
      puts e.backtrace.inspect
      puts e.message
      source.incorrect_scrape
    end

  end #scrape_conferencealerts_portugal

  
def scrape_event_conferencealerts_portugal(event_url)
    begin
      name = ""
      description = ""
      idiomas_disponibles = [:en]
      puts event_url
      event_page = Nokogiri::HTML(open(event_url))
      scraped_event=Event.new

      begin
        name=event_page.css("span#eventNameHeader")[0].text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
        puts "Name: " + name
      rescue
        puts "Failed Name conferencealerts_portugal"
      end
       
      begin
        description= strip_tags event_page.css("span#eventDescription")[0].text.strip()
        #puts "Description: " + description
      rescue
        puts "Failed Description conferencealerts_portugal"
      end             

      begin        
        address=event_page.css("span#eventCountry")[0].text.strip       
        #puts "Address: " + address
      rescue
        puts "Failed Address conferencealerts_portugal"
      end

      begin
       date=event_page.css("span#eventDate")[0].text
       start_date = date.split("to")[0].strip
       end_date = date.split("to")[1].strip
       start_date = start_date.split(" ")
        
       if start_date.count == 1
         start_date = start_date[0]        
         start_date = start_date + " " + end_date.split(" ")[1].to_s + " " + end_date.split(" ")[2].to_s       
       elsif start_date.count == 2
         start_date = start_date[0] + " " + start_date[1]                   
         start_date = start_date + " " + end_date.split(" ")[2].to_s
       end
              
       start_date=Chronic.parse(start_date).strftime('%Y-%m-%d')
       #puts "start_date: " + start_date 
       end_date=Chronic.parse(end_date).strftime('%Y-%m-%d')
       #puts "end_date: " + end_date        
      rescue 
        puts "Failed Data conferencealerts_portugal"
      end
      
      begin
        tags = Array.new
        tags << event_page.css("span#smallerHeading")[0].text.strip
      rescue
        puts "Failed tags conferencealerts_portugal"
      end

      scraped_from = "http://www.conferencealerts.com"
      
      I18n.locale = "en"        
      scraped_event.name=name
      scraped_event.description=description
      scraped_event.start_date=start_date
      scraped_event.end_date=end_date
      scraped_event.address=address
      scraped_event.url=event_url
      scraped_event.link = event_url
      scraped_event.scraped_from=scraped_from
      
      prosa = name + ". " + description  
      scraped_event.persist(idiomas_disponibles,prosa,tags)
     
    rescue Exception => e
      puts "Exception scrape_event_conferencealerts_portugal"
      puts e.backtrace.inspect
      puts e.message            # Test de excepción
    end
  end #scrape_event_conferencealerts_portugal
  
  


  #############################################################################
  #                        scrape_allconferences                              #
  #############################################################################
  
   
 def scrape_allconferences(*opcionales)
    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'

    url="http://www.allconferences.com/search/index/Category__parent_id:1/sort:start_date/direction:asc/showLastConference:0/"

    begin
      source_name = __method__.to_s    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Event", "http://www.allconferences.com/")             
      page = Nokogiri::HTML(open(url))
      i=0
      
      if opcionales[0]!=1 
        page.css(".listing").each do |item|
          i+=1
          scrape_event_allconferences item.css(".listing_content .conferenceHead h2 a")[0]['href']
        end       
      end
      
      if opcionales[0]!=1    
        siguiente = page.css("div#categories_conferences div.pager div#buttonsPager a#nextPages")[0]['href']
      else 
        siguiente = opcionales[1]
      end
          
       while siguiente != nil
         sleep 2
         puts "URL_SIGUIENTE --> " + siguiente                
         page2 =  Nokogiri::HTML(open(siguiente))
         page2.css(".listing").each do |item|    
           begin       
              scrape_event_allconferences item.css(".listing_content .conferenceHead h2 a")[0]['href']
           rescue  Exception => e
              puts "Excepcion evaluando item allconferences"        
              puts e.backtrace.inspect
              puts e.message
           end
         end
         siguiente = page2.css("div#categories_conferences div.pager div#buttonsPager a#nextPages")[0]['href']          
       end        
       source.correct_scrape

    rescue  Exception => e
      puts "Exception in scrape_allconferences"
      puts e.backtrace.inspect
      puts e.message
      
      if e.message.to_s == "Connection timed out - connect(2)"
        puts "lanzamos de nuevo el escrapeo"
        scrape_allconferences(1,siguiente)
      end
      source.incorrect_scrape 
    end
  end #scrape_allconferences


  def scrape_event_allconferences(event_url)
    begin
      name = ""
      description = ""
      idiomas_disponibles = [:en]     
      puts event_url
      event_page = Nokogiri::HTML(open(event_url))
      scraped_event=Event.new

      begin
        name=event_page.css("div.conference-info div.conferenceBold h1")[0].text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
        puts "Name: " + name
      rescue
        puts "Failed Name allconferences"
      end

      begin
        description= strip_tags event_page.css("div#conferenceDescription.conference_mod")[0].text.strip()
        #puts "Description: " + description
      rescue
        puts "Failed Description allconferences"
      end

      address = ""

      begin
        event_page.css("div.conference-info p a").each do |location|
          address = address +  location.text + ", "
        end
        address = address.strip
        address[address.length-1]=""
        #puts "Address: " + address
      rescue
        puts "Failed Address allconferences"
      end

      begin
        start_date = event_page.css("tr.odd td")[0].text
        start_date = start_date.split(":")[1].strip        
        start_date = start_date.split("/")[0].strip
        start_date=Chronic.parse(start_date).strftime('%Y-%m-%d')
        #puts "start_date: " + start_date       
        begin
          end_date = event_page.css("tr.odd td")[1].text
          end_date = end_date.split(":")[1].strip
          end_date = end_date.split("/")[0].strip
          end_date=Chronic.parse(end_date).strftime('%Y-%m-%d')
          #puts "end_date: " + end_date
        rescue
          puts "Failed end_date all conferences"
        end
      rescue
        puts "Failed Data allconferences"
      end

      begin
        photo_url=event_page.css("div#container_conference img.conference_logo")[0]['src']
        if photo_url == "http://content.allconferences.com/images/js_css_cache/img/register_now_icon.png" || photo_url == "http://content.allconferences.com/images/js_css_cache/img/question_icon.png"
          photo_url = nil
        end
        #puts "Photo_url: " + photo_url
      rescue
        puts "Failed Photo allconference"
        photo_url=nil
      end
    
      begin     
        tags = Array.new       
        event_page.css("div#categoriesAssociated.conference_mod a").each do |tag|    
          tags =  tags + [tag.text]
        end
      rescue
        puts "Failed tags allconferences"
      end
         
      scraped_from = "http://www.allconferences.com/"
      
      I18n.locale = "en"        
      scraped_event.name=name
      scraped_event.description=description
      scraped_event.start_date=start_date
      scraped_event.end_date=end_date
      scraped_event.address=address
      scraped_event.url=event_url
      scraped_event.link = event_url
      scraped_event.scraped_from=scraped_from
      
      if photo_url!=nil
        begin
          a = URI.parse(photo_url)
          scraped_event.element_image=URI.parse(photo_url)
        rescue
          puts "allconferences: IMAGEN NO GUARDADA"
          scraped_event.element_image.clear
        end
      end      
      prosa = name + ". " + description  
      scraped_event.persist(idiomas_disponibles,prosa,tags)
         
    rescue Exception => e
    puts e.backtrace.inspect
    puts e.message            # Test de excepción
    puts "Excepcion en scrape_event_allconferences"
     if e.message.to_s == "Connection timed out - connect(2)"
        puts "lanzamos de nuevo el escrapeo del evento"
        scrape_event_allconferences(event_url)
      end
    end
  end #scrape_event_allconferences


  #############################################################################
  #                        scrape_worldconferencecalendar                     #
  #############################################################################

  def scrape_worldconferencecalendar

    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'
    
    url="http://www.worldconferencecalendar.com/component/option,com_conference/page,show_all/text_search,/order,0/expand,4/Itemid,26/limit,20/limitstart,0/"
    puts "url: " + url
    
    begin
      source_name = __method__.to_s    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Event", "http://www.worldconferencecalendar.com") 
            
      page = Nokogiri::HTML(open(url, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:26.0) Gecko/20100101 Firefox/26.0"))  
      page.css("tr td#m-m div.item").each do |item|
        photo_url = item.css("a img")[0]['src']
        photo_url = photo_url.gsub("_t","")
        tags = page.css("div.item tr td b")[1].next.text
        sleep 2
        scrape_event_worldconferencecalendar item.css("a")[0]['href'], photo_url, tags          
      end #do
            
      url_final = page.css(".pagenav[title='End']")[0]['href']    
      n=20     
      url = "http://www.worldconferencecalendar.com/component/option,com_conference/page,show_all/text_search,/order,0/expand,4/Itemid,26/limit,20/limitstart," + n.to_s + "/"
       
      while url != url_final         
        sleep 2          
        puts "url siguiente: " + url
        puts "url final: " + url_final 
         
        begin        
          page = Nokogiri::HTML(open(url))  
          page.css("tr td#m-m div.item").each do |item|
            photo_url = item.css("a img")[0]['src']
            photo_url = photo_url.gsub("_t","")
            tags = page.css("div.item tr td b")[1].next.text
            sleep 2
            scrape_event_worldconferencecalendar item.css("a")[0]['href'], photo_url, tags          
          end #do
        rescue
          puts "Excepcion paginando, saltamos a la siguiente página"
        end          
        n+=20       
        url = "http://www.worldconferencecalendar.com/component/option,com_conference/page,show_all/text_search,/order,0/expand,4/Itemid,26/limit,20/limitstart," + n.to_s + "/"            
      end #while
      source.correct_scrape
    rescue  Exception => e
      puts "Exception in worldconferencecalendar"
      puts e.backtrace.inspect
      puts e.message
      source.incorrect_scrape
    end

  end #scrape_worldconferencecalendar

  
  def scrape_event_worldconferencecalendar(event_url, photo_url, tags)
    begin
      name = ""
      description = ""
      idiomas_disponibles = [:en]
      puts event_url
      puts "photo_url: " + photo_url
      event_page = Nokogiri::HTML(open(event_url))
      scraped_event=Event.new
      
      begin
        name=event_page.css("div#c-detail-page h2")[0].text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
        puts "Name: " + name
      rescue
        puts "Failed Name worldconferencecalendar"
      end

      begin
        description = strip_tags event_page.css("div.detail-3")[0].text.strip()
        description = description.gsub("Conference Description:","")
        description = description.gsub("Enlarge Image","")    
        #puts "Description: " + description
      rescue
        puts "Failed Description worldconferencecalendar"
      end            

      begin        
        address = event_page.css("div.detail-2 b")[2].next.text.strip
        #puts "Address: " + address  
      rescue 
        puts "Failed Address worldconferencecalendar"
      end

      start_date = nil
      end_date = nil  
      begin          
        event_page.css("div.detail-1 b").each do |element|                  
          case element.text.strip
            when "Start Date:"
              start_date = element.next.text.strip
              start_date=Chronic.parse(start_date).strftime('%Y-%m-%d')
              #puts "start_date: " + start_date
              scraped_event.start_date=start_date
            when "Last Day:"
              end_date=element.next.text.strip
              end_date=Chronic.parse(end_date).strftime('%Y-%m-%d')
              #puts "end_date: " + end_date
              scraped_event.end_date=end_date
            end      
         end #do        
      rescue 
        puts "Failed Data worldconferencecalendar"
      end
      
      begin
        tags = tags.split("and")
      rescue
        puts "Failed tags worldwonferencecalendar"
      end

      scraped_from = "http://www.worldconferencecalendar.com"
      
      I18n.locale = "en"        
      scraped_event.name=name
      scraped_event.description=description
      scraped_event.start_date=start_date
      scraped_event.end_date=end_date
      scraped_event.address=address
      scraped_event.url=event_url
      scraped_event.link = event_url
      scraped_event.scraped_from=scraped_from
      
      if photo_url!=nil
        begin
          a = URI.parse(photo_url)
          scraped_event.element_image=URI.parse(photo_url)
        rescue
          puts "worldconferencecalendar: IMAGEN NO GUARDADA"
          scraped_event.element_image.clear
        end
      end      
      prosa = name + ". " + description  
      scraped_event.persist(idiomas_disponibles,prosa,tags)
      
    rescue Exception => e
      puts "Exception scrape_event_worldconferencecalendar"
      puts e.backtrace.inspect
      puts e.message            # Test de excepción
    end
  end #scrape_event_worldconferencecalendar



  #############################################################################
  #          scrape_best (board of european students of technology )          #
  #############################################################################

 def scrape_best
    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'
    
    url="http://best.eu.org/student/courses/coursesList.jsp"
    begin
      source_name = __method__.to_s    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Event", "http://best.eu.org")      
      page = Nokogiri::HTML(open(url))
      page.css("td#contentBar.middleBarLayout dl").each do |item|
        tags = item.css("dd b")[0].next.text.strip
        scrape_event_best item.css("dt a")[0]['href'], tags
      end
    rescue  Exception => e
      puts "Exception in scrape_best"
      puts e.backtrace.inspect
      puts e.message
    end
  end #scrape_best

def scrape_event_best(event_url, tags)
    begin
      name = ""
      description = ""
      idiomas_disponibles = [:en]
      puts event_url  
      event_page = Nokogiri::HTML(open(event_url))
      scraped_event=Event.new
      
      begin
        name=event_page.css("td#contentBar.middleBarLayout h1")[0].text.strip().gsub(/\n/," ").gsub(/\s+/,' ')
        puts "Name: " + name
      rescue
        puts "Failed Name best"
      end
                   
      begin
        description = ""
        event_page.css("td#contentBar.middleBarLayout p").each do |parrafo|
          description = description + parrafo.text 
        end
        #puts "Description: " + description
      rescue
        puts "Failed Description best"
      end             

      begin                
        address = event_page.css("td#contentBar.middleBarLayout tr td font i")[0].next.text.strip
        address = address.gsub("(",",")
        address = address.gsub(")","")
        address = address.gsub(".",",")
        #puts "Address: " + address    
      rescue 
        puts "Failed Address best"
      end

      begin             
        date = event_page.css("td#contentBar.middleBarLayout tr td font i")[1].next.text.strip
        start_date = date.split("to")[0].strip
        start_date = Chronic.parse(start_date).strftime('%Y-%m-%d')
        #puts "start_date: " + start_date
        end_date = date.split("to")[1].strip
        end_date = Chronic.parse(end_date).strftime('%Y-%m-%d')
        #puts "end_date: " + end_date        
      rescue 
        puts "Failed Data best"
      end
      
      begin
        tags = tags.split("(")[1]
        tags = tags.gsub(")","")
        tags = tags.split(",")    
      rescue
        puts "Exception tags best"
      end

      scraped_from = "http://best.eu.org"
      
      I18n.locale = "en"        
      scraped_event.name=name
      scraped_event.description=description
      scraped_event.start_date=start_date
      scraped_event.end_date=end_date
      scraped_event.address=address
      scraped_event.url=event_url
      scraped_event.link = event_url
      scraped_event.scraped_from=scraped_from
      
      prosa = name + ". " + description  
      scraped_event.persist(idiomas_disponibles,prosa,tags)

    rescue
      puts "Exception scrape_event_best"
    end
  end #scrape_event_best



#################################################################################
#################################################################################
#################################################################################
#################################################################################
#################################################################################
#################################################################################
#################################################################################
#################################################################################
#################################################################################


def capybara_prueba
  
  Capybara.register_driver :webkit do |app|
  Capybara::Driver::Webkit.new(app, :js_errors => false)
end
  
   Capybara.configure do |config|
      config.run_server = false
      config.current_driver = :webkit
      config.app_host   = "http://gotohungary.com/all-events"
    end
    
    visit('/')


   
    sleep 40
    
    
    #page=all(:xpath, "//span[@class='full-name']")[0]
    #page=all(:css, "span.full-name")[0].text
    #output = File.new("out.txt", "w")
    #output << page.html
    #output.close 
    
    puts page.html
    
    
     event_page = Nokogiri::HTML(page.html)


        tamano = event_page.css(".neta-search-result").size
        puts "el tamanho es: " 
        puts tamano
        
        #visit(event_page.css(".neta-search-more-link-container a")[0].next['href'])
        
       # page.find(".show-more-results").click
       
        click_link('.neta-search-more-link-container a')
        
        sleep 40
        
        event_page = Nokogiri::HTML(page.html)
        
        tamano = event_page.css(".neta-search-result").size
        puts "el tamanho es: " 
        puts tamano
    
    #name=page.find(:css, "#principal_novas").text
    #puts name    
  
  
end







end 