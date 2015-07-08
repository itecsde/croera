# encoding: utf-8

require 'capybara/rails'
require "capybara"
require 'net/http'
require 'net/https'
require 'uri'
require 'mechanize'

#require "capybara/dsl"
class ScraperArtworks
  include ActionView::Helpers::SanitizeHelper
  #include Capybara::DSL
  #############################################################
  ####### scrape_google_art_project
  #############################################################
   
  def killPid(cmd)
    pids = `pidof #{cmd}`
    pid_list = pids.split(" ")
    pid_list.each do |pid|
      puts "Killing pid: "
      puts pid
      Process.kill "TERM", pid.to_i
    end
  end 
    
   
  def scrape_google_art_project(*reintentos)
    begin
      source_name = __method__.to_s    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Artwork", "https://www.google.com/culturalinstitute/project/art-project")
          
      if reintentos[0]==1
      reintentos = reintentos[1].to_i
      else
      reintentos = 2
      end
      
      
=begin            
      collection_id = -1
      Capybara.register_driver :webkit_ignore_ssl do |app|
        browser = Capybara::Driver::Webkit::Browser.new(:ignore_ssl_errors => true)
        Capybara::Driver::Webkit.new(app, :browser => browser)
      end
      Capybara.javascript_driver = :webkit_ignore_ssl
      session = Capybara::Session.new(:webkit)   
      session.visit "https://www.google.com/culturalinstitute/collections"

      collections_urls = Array.new
      
      nokogiri_page = Nokogiri::HTML(session.body)
      total_number_of_collections = nokogiri_page.css("span.gci-partners-list-count")[0].text.split(" of ")[1].to_i
      
      puts "Total number of collections: "
      puts total_number_of_collections
      number_of_collections = 0 
      
      nokogiri_page = Nokogiri::HTML(session.body)
      puts "Number of collections"
        
      
      while number_of_collections < total_number_of_collections
        nokogiri_page.css("li.gci-longlist-item").each do |collection|
          collection_id += 1
          puts "Collection ID = " + collection_id.to_s
          session.all('li.gci-longlist-item')[collection_id].click
          sleep 2
          puts session.current_url
          collections_urls << session.current_url
          File.open('links_collections_google_art_project', 'a') do |f2|
            f2.puts session.current_url
          end
          sleep 2
          session.execute_script('window.history.back();')
          sleep 1
          times_to_scroll = collection_id / 12 + 1
          for j in 1..times_to_scroll
            session.execute_script '$(".gci-scroller-vertical").scrollTop(500000);'       
            nokogiri_current_page = Nokogiri::HTML(session.body)
            number_of_collections = nokogiri_current_page.css("li.gci-longlist-item").size.to_i
            puts number_of_collections
            sleep 1
          end
        end
      end
=end

      #url de donde se saca el fichero con los partners --> https://www.google.com/culturalinstitute/consumer/api/get-partners-list?hl=en

      collection_urls = Array.new
      fentrada = File.new "./harvest/google_art_project_partners.txt","r"
      line = fentrada.gets         

      until line == nil
        if line.include? ',["partner","url_name",'        
          collection_url = "https://www.google.com/culturalinstitute/collection/" + line.split(',,,,["')[1].split('"]')[0]
          collection_urls << URI.encode(collection_url)
        end
        line = fentrada.gets
      end

      fentrada.close 
=begin      
      Capybara.register_driver :webkit_ignore_ssl do |app|
        browser = Capybara::Driver::Webkit::Browser.new(:ignore_ssl_errors => true)
        Capybara::Driver::Webkit.new(app, :browser => browser, :ignore_ssl_errors => true)
      end
      Capybara.javascript_driver = :webkit_ignore_ssl
      session = Capybara::Session.new(:webkit)   
=end
           
      collection_urls.each do |url|
        if !url.include? "the-j-paul-getty-museum"
          scrape_collection_google_art_project url
        end
      end
 
      reintentos = 2
      source.correct_scrape
    rescue Exception => e
      puts "Failed scrape_google_art_project"
      puts e.message
      puts e.backtrace.inspect
      if reintentos > 0
        puts reintentos
        reintentos-=1
        sleep 2
        scrape_google_art_project(1,reintentos)
      end
      source.incorrect_scrape
    end 
  end 
  
  
  def scrape_collection_google_art_project(collection_url)
    begin
      puts "Collection url: " + collection_url
      disabled = false
      artwork_id = -1
      i = 0
      j = 0
          
      puts "Reseting session...."
      sleep 1
      killPid("webkit_server")
      sleep 1
            
      Capybara.register_driver :webkit_ignore_ssl do |app|
        browser = Capybara::Driver::Webkit::Browser.new(:ignore_ssl_errors => true)
        Capybara::Driver::Webkit.new(app, :browser => browser, :ignore_ssl_errors => true)
      end
      Capybara.javascript_driver = :webkit_ignore_ssl
      session = Capybara::Session.new(:webkit)   

      puts "Session reset."
      
      puts "Entering the gallery..."
            
      session.visit collection_url    
      
      puts "Touring the gallery..."
      
      while disabled != true
        session.find('.gci-nav-button.gci-nav-next').click
        j+=1
        sleep 3
        nokogiri_clicked_page = Nokogiri::HTML(session.body)
        if j % 50 == 0
          nokogiri_html_collection_page = Nokogiri::HTML(session.body)
          puts "Numero de elementos de la galeria hasta el momento = " + nokogiri_html_collection_page.css("div.gci-asset-gallery-item").size.to_s
        end    
        if nokogiri_clicked_page.css("div.gci-page-arrow")[1]['disabled'] == "disabled"
          sleep 10
          nokogiri_clicked_page = Nokogiri::HTML(session.body)
          if nokogiri_clicked_page.css("div.gci-page-arrow")[1]['disabled'] == "disabled"
            disabled = true
          end
        end
      end
     
      sleep 1            
      puts "Enjoying the collection..."         
                          
      nokogiri_html_collection_page = Nokogiri::HTML(session.body)
      begin
        address = nokogiri_html_collection_page.css(".gci-ui-itemsviewer-map-info p.gci-ui-itemsviewer-map-address")[0].text.strip
        puts "Museum Addres: " + address
      rescue
        puts "Failed address art_project"
      end
      puts "Numero de elementos de la galeria = " + nokogiri_html_collection_page.css("div.gci-asset-gallery-item").size.to_s
      nokogiri_html_collection_page.css("div.gci-asset-gallery-item").each do |artwork|
        sleep 2  
        artwork_id += 1
        begin
          photo_url = artwork.css(".gci-asset-gallery div.collections-image-holder div.holder-background")[0]['style']          
          if photo_url.include? "=s"
            photo_url = photo_url.split("url(")[1].split("=s")[0]
          else
            photo_url = photo_url.split("url(")[1].split(");")[0]
          end
        rescue Exception => e
          puts "Exception photo_url art_project"
          puts e.message
          puts e.backtrace.inspect
        end  
       
        begin    
          session.all('.gci-asset-gallery div.gci-asset-title-date a.gci-asset-title')[artwork_id].click
          sleep 2
          session.find('button.collections-ui-button span.collections-ui-button-content').click
          sleep 1
          nokogiri_html_detail_page = Nokogiri::HTML(session.body)
          artwork_url = session.current_url
          artwork_url = artwork_url.gsub("?projectId=art-project","")      
          if Artwork.where(:url => artwork_url).size == 0
            scrape_artwork_google_art_project artwork_url, photo_url, nokogiri_html_detail_page, session.body, address
          else
            puts "This artwork already exists in the gallery."
          end
          session.evaluate_script('window.history.back()')
          sleep 2
        rescue Exception => e
          puts "Exception artwork -> collection_google_art_project"
          puts e.message
          puts e.backtrace.inspect
        end      
      end #do artwork
    rescue Exception => e
      puts "Failed scrape_collection_google_art_project"
      puts e.message
      puts e.backtrace.inspect      
    end 
  end
  
  def scrape_artwork_google_art_project(artwork_url, photo_url, nokogiri_html_detail_page, raw_html, address)
    begin
      manual_tags = Array.new
      name = ""
      description = ""
      prosa = ""
      idiomas_disponibles = ["en"]
      
      puts artwork_url
      
      begin
        name = nokogiri_html_detail_page.css("h1.gci-unified-header-title-container span.gci-asset-viewer-title")[0].text.strip
      rescue
        puts "Exception name art_project"
      end
      
      puts name
      
      begin
        description = nokogiri_html_detail_page.css("div.gci-asset-viewer-tab-description-content")[0].text.strip
        if description.include? "No further details available"
          description = ""
        end
      rescue
        puts "Exception description art_project"
      end
      
      begin
        author = nokogiri_html_detail_page.css("span.gci-asset-viewer-creator")[0].text.strip       
      rescue
        puts "Failed Author art_project"
      end

      begin
        museum = nokogiri_html_detail_page.css("a.gci-asset-viewer-partner")[0].text.strip       
      rescue
        puts "Failed museum art_project"
      end
      
      begin
        url = artwork_url
      rescue
        puts "Exception URL art_project"
      end      
      
      manual_tags << author
      manual_tags << museum

      if name != nil
        prosa = prosa + name
      end
      if description != nil
        prosa = prosa + ". " + description
      end   

      scraped_artwork = Artwork.new
      I18n.locale = "en"
      scraped_artwork.name = name
      scraped_artwork.description = description
      scraped_artwork.author = author
      scraped_artwork.museum = museum
      scraped_artwork.address = address
      if photo_url!=nil
        begin
          scraped_artwork.element_image = URI.parse(photo_url)
        rescue
          puts "art_project: IMAGEN NO GUARDADA"
          scraped_artwork.element_image.clear
        end
      end      
      scraped_artwork.url = url
      scraped_artwork.link = url
      scraped_artwork.raw_html = raw_html
      scraped_artwork.scraped_from = "https://www.google.com/culturalinstitute/project/art-project"
      scraped_artwork.persist(idiomas_disponibles, prosa, manual_tags)
    rescue Exception => e
      puts "Failed scrape_artwork_google_art_project"
      puts e.message
      puts e.backtrace.inspect
    end
  end
  
  
  def scrape_mismuseos(*reintentos)
    begin
      source_name = __method__.to_s    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Artwork", "http://mismuseos.net")
      
      artwork_id = -1
          
      if reintentos[0]==1
      reintentos = reintentos[1].to_i
      else
      reintentos = 2
      end
          
      url = "http://mismuseos.net/comunidad/metamuseo/login"
      
      Capybara.register_driver :webkit_ignore_ssl do |app|
        browser = Capybara::Driver::Webkit::Browser.new(:ignore_ssl_errors => true)
        Capybara::Driver::Webkit.new(app, :browser => browser)
      end
      Capybara.javascript_driver = :webkit_ignore_ssl
      session = Capybara::Session.new(:webkit)   
      session.visit url
      
      session.find('input#ctl00_ctl00_CPH1_CPHContenido_controles_registro_registrodatos_ascx_txtUsuarioLogin.text').set "itecsde@gmail.com"
      session.find('input#ctl00_ctl00_CPH1_CPHContenido_controles_registro_registrodatos_ascx_txtContrasenyaLogin.text').set "itecsde2014"         
      session.find("input#ctl00_ctl00_CPH1_CPHContenido_controles_registro_registrodatos_ascx_hlLoginCuenta.principal").click
      sleep 1
      session.all(".nivel01")[1].find("a").click   
      sleep 1
      
      exists_next_page = true
         
      while exists_next_page == true
        begin
          puts "Exists new page"
          nokogiri_page = Nokogiri::HTML(session.body)              
          nokogiri_page.css("div#ListadoGenerico_controles_ficharecurso_ascx_divResource.resource div#ListadoGenerico_controles_ficharecurso_ascx_divResourceInt.box div.group p.miniatura a").each do |artwork|
            artwork_id += 1
            artwork_url = artwork['href']
            puts artwork_url
           
            if Artwork.where(:url => artwork_url).size == 0
              session.all("div#ListadoGenerico_controles_ficharecurso_ascx_divResource.resource div#ListadoGenerico_controles_ficharecurso_ascx_divResourceInt.box div.group p.miniatura a")[artwork_id].click
              sleep 1
              artwork_raw_html = session.body
              artwork_url = session.current_url
              scrape_artwork_mismuseos artwork_url, artwork_raw_html
              session.evaluate_script('window.history.back()')
              sleep 1
            else
              puts "This artwork already exists in the gallery."
            end
          end
          
          if session.has_css?("a.indiceNavegacion.filtro.ultimaPagina") == true
            exists_next_page = true
            artwork_id = -1
            session.find("a.indiceNavegacion.filtro.ultimaPagina").click
            sleep 2
          else
            exists_next_page = false
          end
        rescue
          puts "Failed pagination mismuseos"
        end
      end
      
      source.correct_scrape
    rescue Exception => e
      puts "Exception scrape_mismuseos"
      puts e.message
      puts e.backtrace.inspect
      if reintentos > 0
        puts reintentos
        reintentos-=1
        sleep 2
        scrape_mismuseos(1,reintentos)
      end
      source.incorrect_scrape
    end
  end
  
  
  def scrape_artwork_mismuseos(artwork_url, artwork_raw_html)
    begin
      manual_tags = Array.new
      name = ""
      description = ""
      prosa = ""
      idiomas_disponibles = ["es"]
      
      puts artwork_url
      nokogiri_artwork_page = Nokogiri::HTML(artwork_raw_html)

      begin
        photo_url = nokogiri_artwork_page.css("div.contentGroup div.cont span.values a.value img")[0]['src']      
        puts "Photo_url: " + photo_url
      rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
        puts "Failed photo_url mismuseos"
      end

      begin
        name = nokogiri_artwork_page.css("div.group h1 div.edit span.values span.value")[0].text.strip
        puts "Name: " + name
      rescue
        puts "Exception name mismuseos"
      end

      begin
        description = nokogiri_artwork_page.css("div.group.groupDesyCla div.contentGroup")[0].text.strip
        puts "Description: " + description
      rescue
        puts "Exception description mismuseos"
      end
 
      begin
        author = nokogiri_artwork_page.css("div.autor span.values a.value")[0].text.strip
        puts "Author: " + author       
      rescue
        puts "Failed Author mismuseos"
      end

      begin
        museum = nokogiri_artwork_page.css("div.group.groupLocalizacion span.value a.value")[0].text.strip      
        puts "Museum: " + museum 
      rescue
        puts "Failed museum mismuseos"
      end
       
      begin
        city = nokogiri_artwork_page.css("div.group.groupLocalizacion .contentGroup .contSelEnt.contSelEnt_city")[0].text.strip      
      rescue
        puts "Failed address mismuseos"
      end
      
      begin
        address = museum + ", " + city
      rescue
        puts "Failed address mismuseos"
      end
     
      url = artwork_url

      manual_tags << author
      manual_tags << museum

      if name != nil
        prosa = prosa + name
      end
      if description != nil
        prosa = prosa + ". " + description
      end   
      
      scraped_artwork = Artwork.new
      I18n.locale = "es"
      scraped_artwork.name = name
      scraped_artwork.description = description
      if photo_url!=nil
        begin
          scraped_artwork.element_image = URI.parse(photo_url)
        rescue
          puts "mismuseos: IMAGEN NO GUARDADA"
          scraped_artwork.element_image.clear
        end
      end      
      scraped_artwork.author = author
      scraped_artwork.museum = museum
      scraped_artwork.address = address
      scraped_artwork.url = url
      scraped_artwork.link = url
      scraped_artwork.raw_html = artwork_raw_html
      scraped_artwork.scraped_from = "http://mismuseos.net"
      scraped_artwork.persist(idiomas_disponibles, prosa, manual_tags)
    rescue Exception => e
      puts "Exception scrape_artwork_mismuseos"
      puts e.message
      puts e.backtrace.inspect
    end
  end
  
   def scrape_google_world_wonders_project()
    begin
      i = 0
      j = 0
      disabled = false
      valids = Array.new
      source_name = __method__.to_s    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Artwork", "http://www.google.com/culturalinstitute/project/world-wonders")
      
      Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(app)
      end
      Capybara.javascript_driver = :selenium
      session = Capybara::Session.new(:selenium)   
            
      session.visit "http://www.google.com/culturalinstitute/browse/?projectId=world-wonders"
         
      session.all(".gci-ui-tabs-label-container span.gci-ui-tabs-label").each do |tab|
        if tab.text.downcase == "medium" or tab.text.downcase == "soporte"
          tab.click
          sleep 3
        end 
      end              
      
      session.all(".gci-ui-tabs-content.gci-ui-tab-active li div.gci-faceter-value").each_with_index do |element, index|
        if element.visible?
          if !session.all(".gci-ui-tabs-content.gci-ui-tab-active li div.gci-faceter-value")[index].visible?
            increment = 30
            while !session.all(".gci-ui-tabs-content.gci-ui-tab-active li div.gci-faceter-value")[index].visible?
              sleep 1
              session.execute_script '$(".gci-faceter-value-container.collections-scroller.gci-scroller-vertical").scrollTop(' + increment.to_s + ');'
              sleep 1
              increment+=30
            end
          end
          sleep 2
          session.all(".gci-ui-tabs-content.gci-ui-tab-active li div.gci-faceter-value")[index].click
          sleep 3
          nokogiri_html_page = Nokogiri::HTML(session.body)
          number_of_items = nokogiri_html_page.css("span.gci-ui-itemsviewer-count")[0].text.to_i
          puts "Number of items = "
          puts number_of_items
          number_of_items_so_far = 0
          
          while number_of_items_so_far < number_of_items
            sleep 2
            session.execute_script '$(".gci-browse-results.collections-scroller.gci-scroller-vertical").scrollTop(500000);'
            sleep 2        
            j+=1
            sleep 2
            nokogiri_scrolled_page = Nokogiri::HTML(session.body)
            if j % 1 == 0
              nokogiri_html_page = Nokogiri::HTML(session.body)
              number_of_items_so_far = nokogiri_html_page.css("div.gci-ui-itemsviewer-view-content div.gci-ui-fragment div.gci-asset-grid-item").size.to_i
              puts "Number of items so far = "               
              puts number_of_items_so_far
            end    
          end        

          nokogiri_artworks_page = Nokogiri::HTML(session.body)
            
          session.all("div.gci-ui-fragment div.gci-asset-grid-item").each_with_index do |artwork, artwork_index|
            sleep 2
            artwork.click
            sleep 2 
            session.find('button.collections-ui-button').click
            sleep 2
            begin
              photo_url = nokogiri_artworks_page.css("div.gci-ui-fragment div.gci-asset-grid-item div.gci-asset-grid div.collections-asset-thumbnail div.collections-image-holder div.holder-background")[artwork_index]['style']
              if photo_url.include? "=s"
                photo_url = photo_url.split('url("')[1].split("=s")[0]
              else
                photo_url = photo_url.split('url("')[1].split(");")[0]
              end
            rescue
              puts "Failed Photo world_wonders"
            end
            nokogiri_html_detail_page = Nokogiri::HTML(session.body)
            artwork_url = session.current_url
            artwork_url = artwork_url.gsub("?projectId=art-project","")      
            if Artwork.where(:url => artwork_url).size == 0
              scrape_artwork_google_world_wonders_project artwork_url, photo_url, nokogiri_html_detail_page, session.body
            else
              puts "This artwork already exists in the gallery."
            end           
            session.evaluate_script('window.history.back()')
            sleep 2
          end
                   
          session.evaluate_script('window.history.back()')
          sleep 3
          session.all(".gci-ui-tabs-label-container span.gci-ui-tabs-label").each do |tab|
            if tab.text.downcase == "medium" or tab.text.downcase == "soporte"
              tab.click
              sleep 3
            end 
          end  
        end
      end
      source.correct_scrape
    rescue Exception => e
      puts "Failed scrape_google_world_wonders_project"
      puts e.message
      puts e.backtrace.inspect
      source.incorrect_scrape
    end 
  end 
  
  def scrape_artwork_google_world_wonders_project(artwork_url, photo_url, nokogiri_html_detail_page, raw_html)
    begin
      manual_tags = Array.new
      name = ""
      description = ""
      prosa = ""
      idiomas_disponibles = ["en"]
      
      puts artwork_url
      
      begin
        name = nokogiri_html_detail_page.css("h1.gci-unified-header-title-container span.gci-asset-viewer-title")[0].text.strip
      rescue
        puts "Exception name world_wonders"
      end
      
      puts name
      
      begin
        description = nokogiri_html_detail_page.css("div.gci-asset-viewer-tab-description-content")[0].text.strip
        if description.include? "No further details available"
          description = ""
        end
      rescue
        puts "Exception description world_wonders"
      end

      begin
        author = nokogiri_html_detail_page.css("span.gci-asset-viewer-creator")[0].text.strip       
      rescue
        puts "Failed Author world_wonders"
      end
      
      begin
        museum = nokogiri_html_detail_page.css("a.gci-asset-viewer-partner")[0].text.strip       
      rescue
        puts "Failed museum world_wonders"
      end
      
      begin
        url = artwork_url
      rescue
        puts "Exception URL world_wonders"
      end      
      
      manual_tags << author
      manual_tags << museum

      if name != nil
        prosa = prosa + name
      end
      if description != nil
        prosa = prosa + ". " + description
      end   

      scraped_artwork = Artwork.new
      I18n.locale = "en"
      scraped_artwork.name = name
      scraped_artwork.description = description
      scraped_artwork.author = author
      scraped_artwork.museum = museum
      if photo_url!=nil
        begin
          scraped_artwork.element_image = URI.parse(photo_url)
        rescue
          puts "world_wonders_project: IMAGEN NO GUARDADA"
          scraped_artwork.element_image.clear
        end
      end      
      scraped_artwork.url = url
      scraped_artwork.link = url
      scraped_artwork.raw_html = raw_html
      scraped_artwork.scraped_from = "http://www.google.com/culturalinstitute/project/world-wonders"
      scraped_artwork.persist(idiomas_disponibles, prosa, manual_tags)
    rescue Exception => e
      puts "Failed scrape_artwork_world_wonders_project"
      puts e.message
      puts e.backtrace.inspect
    end
  end
  
   
  def scrape_wikipaintings(*reintentos)
    begin
      source_name = __method__.to_s    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Artwork", "http://www.wikipaintings.org")
          
      if reintentos[0]==1
      reintentos = reintentos[1].to_i
      else
      reintentos = 2
      end
      
      for i in 'A'..'Z' do
        url = "http://www.wikipaintings.org/en/Alphabet/" + i.to_s
        page = Nokogiri::HTML(open(url))
        reintentos = 2    
        page.css("div.Artist div.big div.search-item").each do |artist|
          artist_url = "http://www.wikipaintings.org" + artist.css("div.pozRel a.an")[0]['href']
          scrape_artist_wikipaintings artist_url 
        end
      end      
      
      source.correct_scrape
    rescue Exception => e
      puts "Failed scrape_wikipaintings"
      puts e.message
      puts e.backtrace.inspect
      if reintentos > 0
        puts reintentos
        reintentos-=1
        sleep 2
        scrape_wikipaintings(1,reintentos)
      end
      source.incorrect_scrape
    end 
  end 
  
  def scrape_artist_wikipaintings(artist_url, *reintentos)
    begin
      puts artist_url
      if reintentos[0]==1
      reintentos = reintentos[1].to_i
      else
      reintentos = 2
      end
      
      artworks_artist_url = artist_url + "/mode/all-paintings-by-alphabet"
      artworks_artist_page = Nokogiri::HTML(open(artworks_artist_url))
      
      artworks_artist_page.css("div.Painting div.search-row ins.search-item").each do |artwork|
        artwork_url = "http://www.wikipaintings.org" + artwork.css("div.fl p.bigtext a")[0]['href']
        scrape_artwork_wikipaintings artwork_url
      end
    
      if !artworks_artist_page.css("div.pager-row div.pager-items").empty?
        next_page = ""
        while next_page != nil
          if next_page != ""
            puts next_page
            artworks_artist_page = Nokogiri::HTML(open(next_page))
            artworks_artist_page.css("div.Painting div.search-row ins.search-item").each do |artwork|
              artwork_url = "http://www.wikipaintings.org" + artwork.css("div.fl p.bigtext a")[0]['href']
              scrape_artwork_wikipaintings artwork_url
            end
          end
          artworks_artist_page.css("div.pager-row div.pager-items a").each do |pager|
            if pager.text ==  "Next"
              next_page = pager['href']
            else
              next_page = nil
            end  
          end
        end
      end
      
    rescue Exception => e
      puts "Failed scrape_artist_wikipaintings"
      puts e.message
      puts e.backtrace.inspect
      if reintentos > 0
        puts reintentos
        reintentos-=1
        sleep 2
        scrape_artist_wikipaintings(artist_url, 1,reintentos)
      end
    end 
  end 
  
  def scrape_artwork_wikipaintings(artwork_url)
    begin
      if Artwork.where(:url => artwork_url).size == 0      
        puts artwork_url
        manual_tags = Array.new
        name = ""
        description = ""
        prosa = ""
        author = ""
        museum = ""
        
        artwork_html_page = open(artwork_url, &:read)
        nokogiri_artwork_page = Nokogiri::HTML(artwork_html_page)
  
        begin
          photo_url = nokogiri_artwork_page.css("div.ImageProfileBox div.pozRel a#paintingImage img")[0]['src']      
        rescue Exception => e
          puts e.message
          puts e.backtrace.inspect
          puts "Failed photo_url wikipaintings"
        end
  
        begin
          name = nokogiri_artwork_page.css("div.wp_base div.wp_content div div.tt30 h1")[0].text.strip
          puts "Name: " + name
        rescue
          puts "Exception name wikipaintings"
        end
  
        begin
          description = nokogiri_artwork_page.css("div.DataProfileBox p.readMoreText")[0].text.strip
        rescue
          puts "Exception description wikipaintings"
        end
      
        begin
          nokogiri_artwork_page.css("div.DataProfileBox p.pt10").each do |section|
            begin
              if !section.css("a").empty?
                section.css("a").each do |tag|
                  manual_tags << tag.text
                  if tag.parent.text.include? "Artist"
                    author = tag.text.strip
                  end
                end
              end
            rescue Exception => e
              puts "Failed section tags wikipaintings"
              puts e.message
              puts e.backtrace.inspect
            end
          end
        rescue Exception => e
          puts "Failed Tags wikipaintings"
          puts e.message
          puts e.backtrace.inspect
        end
  
        begin
          nokogiri_artwork_page.css("div div.ArtistInfo div.DataProfileBox p.pt10").each do |item|
            if item.css("b").text.strip == "Gallery:"
              museum = item.text.gsub("Gallery:","").strip
            end
          end
          manual_tags << museum
        rescue
          puts "Failed museum wikipaintings"
        end
  
        if name != nil
          prosa = prosa + name
        end
        if description != nil
          prosa = prosa + ". " + description
        end   
        
        scraped_artwork = Artwork.new
        I18n.locale = "en"
        scraped_artwork.name = name
        scraped_artwork.description = description
        if photo_url!=nil
          begin
            scraped_artwork.element_image = URI.parse(photo_url)
          rescue
            puts "wikipaintings: IMAGEN NO GUARDADA"
            scraped_artwork.element_image.clear
          end
        end      
        scraped_artwork.author = author
        scraped_artwork.museum = museum
        scraped_artwork.url = artwork_url
        scraped_artwork.link = artwork_url
        scraped_artwork.raw_html = artwork_html_page
        scraped_artwork.scraped_from = "http://www.wikipaintings.org"
        scraped_artwork.persist([], prosa, manual_tags)
      else
        puts "This artwork already existes in the gallery."
      end
    rescue Exception => e
      puts "Exception scrape_artwork_wikipaintings"
      puts e.message
      puts e.backtrace.inspect
    end
  end  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
end #class