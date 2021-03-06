# encoding: utf-8

require 'capybara/rails'
require "capybara"
require "capybara/dsl"
require "mechanize"

class ScraperBiographies
  include ActionView::Helpers::SanitizeHelper
  include Capybara::DSL
  
  #############################################################
  ####### SCRAPE_BIOGRAPHY
  ###########################################################
  def scrape_biography (*siguiente)
    begin
      source_name = __method__.to_s    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Biography", "http://biography.com/")
      
      if siguiente[1]==1
        reintentos = siguiente[2]
      else
        reintentos = 2
      end    
      
      Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(app)
      end
      Capybara.javascript_driver = :selenium
      session = Capybara::Session.new(:selenium)   
      
      url = "http://www.biography.com/people"

      session.visit url
      
      sleep 4

      page = Nokogiri::HTML(session.body)
      
      i=0

      while i == 0
         page.css(" div.l-feed--grid article.ng-scope span.ng-scope div.m-item--summary h2.m-item--hed a.ng-binding").each do |person|
            i+=1
            puts i
            scrape_biography_biography "http://www.biography.com" + person['href']
            if i == 24
               session.find("div#feed-loader-prompt").click
               sleep 5
               page = Nokogiri::HTML(session.body)
               i = 0
            end
         end
      end

      source.correct_scrape
    rescue  Exception => e
      puts "Exception in scrape_biography"
      puts "Reintentamos dos veces, sino abortamos"
      puts e.backtrace.inspect
      puts e.message
      if reintentos > 0
        puts reintentos
        reintentos-=1
        sleep 2
        scrape_biography(siguiente,1,reintentos)
      end
      source.incorrect_scrape
    end
  end #scrape_biography
  
 def scrape_biography_biography(biography_url, *reintentos)
      begin
         name = ""
         description = ""
         if !biography_url.include? "/groups"
            puts "biography---" + biography_url
            idiomas_disponibles = Array.new
            human_tags = Array.new
            tags = Array.new

            if reintentos[0]==1
            reintentos = reintentos[1].to_i
            else
            reintentos = 2
            end

            Capybara.register_driver :selenium do |app|
               Capybara::Selenium::Driver.new(app)
            end
            Capybara.javascript_driver = :selenium
            session2 = Capybara::Session.new(:selenium)

            session2.visit biography_url
            
            sleep 4

            biography_page = Nokogiri::HTML(session2.body)
            
            raw_html = session2.body
            
            session2.driver.browser.quit
            
            scraped_biography = Biography.new

            begin
               name = biography_page.css("article.ng-isolate-scope span.ng-scope div.l-wrap h1.m-person--hed")[0].text.gsub("Biography","").strip
               puts "Name: " + name
            rescue Exception => e
               puts "Exception name biography"
               puts e.message
               puts e.backtrace.inspect
            end

            begin
               wikipediator = Wikipediator.new
               urls_translations = wikipediator.translations_urls(name)
               urls_translations.each do |url_translations|
                  begin
                     puts "Obteniendo informacion en idioma: " + url_translations[:lang]
                     I18n.locale = url_translations[:lang]
                     wikipedia_page = Nokogiri::HTML(open(url_translations[:url].gsub(" ","%20")))
                     description = ""
                     wikipedia_page.css("div#mw-content-text p").each_with_index do |parrafo, index|
                        if index < 3
                        description = description + parrafo.text
                        end
                     end
                     idiomas_disponibles << url_translations[:lang]
                     scraped_biography.name = url_translations[:name]
                     scraped_biography.description = description.gsub(/\[.\]/, "") #eliminamos los corchetes de este tipo [x], con x € [0,9]
                     scraped_biography.link = biography_url
                  rescue
                     puts "Exceptions translation language => " + url_translations[:lang]
                  end
               end
            rescue Exception => e
               puts "Exception translations biography"
               puts e.message
               puts e.backtrace.inspect
            end

            description = ""
            begin
               biography_page.css("section.m-person--copy p").each do |parrafo|
                  description = description + parrafo.text.strip
               end
            rescue Exception => e
               puts "Exception description biography"
               puts e.message
               puts e.backtrace.inspect
            end

            begin
               photo_url = biography_page.css("article.ng-isolate-scope span.ng-scope div.m-person--image")[0]['image']
               puts photo_url
            rescue Exception => e
               puts "Failed Photo biography"
            end

            prosa = name + ". " + description

            scraped_from = "http://biography.com/"
            I18n.locale = "en"
            idiomas_disponibles << "en"
            
            scraped_biography.name = name
            scraped_biography.description = description
            scraped_biography.url = biography_url
            scraped_biography.link = scraped_biography.url
            scraped_biography.scraped_from = scraped_from
            scraped_biography.raw_html = raw_html

            if photo_url!=nil
               begin
                  a = URI.parse(photo_url)
                  scraped_biography.element_image=URI.parse(photo_url)
               rescue
                  puts "biography  IMAGEN NO GUARDADA"
               scraped_biography.element_image.clear
               end
            end
         scraped_biography.persist(idiomas_disponibles,prosa,tags)
         reintentos = 2
         end

      rescue Exception => e
         puts "Exception scrape_biography_biography"
         puts e.backtrace.inspect
         puts e.message
         puts reintentos
         if reintentos > 0
            reintentos-=1
            sleep 2
            scrape_biography_biography(biography_url,1,reintentos)
         end
      end

   end #scrape_biography_biography
  
  
  #############################################################
  ####### SCRAPE_TED
  ###########################################################
  def scrape_ted(*siguiente)
    begin
      source_name = __method__.to_s    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Biography", "http://www.ted.com")
     
      speaker_number = 0   
        
      if siguiente[1]==1
        reintentos = siguiente[2]
      else
        reintentos = 2
      end    
      url = "http://www.ted.com/speakers"

      if siguiente[1]!=1
        page = Nokogiri::HTML(open(url))
        reintentos = 2
    
        page.css("div#browse-results.container div.row div.col a.results__result").each do |biography|
          biography_url = "http://www.ted.com" + biography['href']
          puts speaker_number += 1
          scrape_biography_ted biography_url
        end
      end

      if siguiente[1]!=1
        if !page.css("div.results__pagination div.pagination a.pagination__next.pagination__flipper.pagination__link").empty? 
          siguiente = "http://www.ted.com" + page.css("div.results__pagination div.pagination a.pagination__next.pagination__flipper.pagination__link")[0]['href']
        end
      else
        siguiente = siguiente[0]
      end

      while siguiente != nil
        sleep 2
        puts "URL_SIGUIENTE --> " + siguiente
        page2 =  Nokogiri::HTML(open(siguiente))
        reintentos = 2

        page2.css("div#browse-results.container div.row div.col a.results__result").each do |biography|
          biography_url = "http://www.ted.com" + biography['href']
          puts speaker_number += 1
          scrape_biography_ted biography_url
        end

        if !page2.css("div.results__pagination div.pagination a.pagination__next.pagination__flipper.pagination__link").empty? 
          siguiente = "http://www.ted.com" + page2.css("div.results__pagination div.pagination a.pagination__next.pagination__flipper.pagination__link")[0]['href']
        else
          siguiente = nil
        end
      end      
      source.correct_scrape
    rescue  Exception => e
      puts "Exception in scrape_biography"
      puts "Reintentamos dos veces, sino abortamos"
      puts e.backtrace.inspect
      puts e.message
      if reintentos > 0
        puts reintentos
        reintentos-=1
        sleep 2
        scrape_biography(siguiente,1,reintentos)
      end
      source.incorrect_scrape
    end
  end #scrape_ted
  
  
  def scrape_biography_ted(biography_url, *reintentos)
    begin
      name = ""
      description = ""
      puts "biography---" + biography_url
      idiomas_disponibles = Array.new
      human_tags = Array.new
      tags = Array.new

      if reintentos[0]==1
        reintentos = reintentos[1].to_i
      else
        reintentos = 2
      end            
        
      biography_page = Nokogiri::HTML(open(biography_url))
      scraped_biography = Biography.new      

      begin
        name = biography_page.css("div.profile-header__intro__inner h1.h2")[0].text.strip
        puts "Name: " + name 
      rescue
        puts "Exception name biography ted"
      end
      
      begin       
        wikipediator = Wikipediator.new      
        urls_translations = wikipediator.translations_urls(name)
        urls_translations.each do |url_translations|
          begin
          puts "Obteniendo informacion en idioma: " + url_translations[:lang]
          I18n.locale = url_translations[:lang]
          wikipedia_page = Nokogiri::HTML(open(url_translations[:url].gsub(" ","%20")))
          description = ""
          wikipedia_page.css("div#mw-content-text p").each_with_index do |parrafo, index|
            if index < 3
              description = description + parrafo.text
            end
          end        
          idiomas_disponibles << url_translations[:lang]
          scraped_biography.name = url_translations[:name]
          scraped_biography.description = description.gsub(/\[.\]/, "") #eliminamos los corchetes de este tipo [x], con x € [0,9]
          scraped_biography.link = biography_url
          rescue
            puts "Exceptions translation language => " + url_translations[:lang]
          end
        end
      rescue Exception => e
        puts "Exception translations biography"
        puts e.message
        puts e.backtrace.inspect
      end   
      
      description = ""
      begin
        profile_intro = biography_page.css("div.col-lg-8 div.profile-intro")[0].text.strip       
        biography_page.css("div.col-lg-8 div.section div.p3").each do |parrafo|
          description = description + parrafo.text.strip
        end
        description = profile_intro + description
        puts description
      rescue Exception => e
        puts "Exception description biography ted"
        puts e.message
        puts e.backtrace.inspect
      end

      begin
        human_tags << biography_page.css("div.profile-header__intro div.profile-header__intro__inner div.p2")[0].text.strip
      rescue Exception => e
        puts "Failed Human Tags biography ted"
        puts e.message
        puts e.backtrace.inspect
      end
      
      begin
        photo_url = biography_page.css("span.thumb__tugger img.thumb__image")[0]['src']
      rescue
        puts "Failed Photo biography ted"
      end
      
      prosa = name + ". " + description
             
      scraped_from = "http://www.ted.com"
      I18n.locale = "en"
      scraped_biography.name = name
      scraped_biography.description = description
      scraped_biography.url = biography_url
      scraped_biography.link = scraped_biography.url
      scraped_biography.scraped_from = scraped_from

      if photo_url!=nil
        begin
          a = URI.parse(photo_url)
          scraped_biography.element_image=URI.parse(photo_url)
        rescue
          puts "biography ted  IMAGEN NO GUARDADA"
          scraped_biography.element_image.clear
        end
      end       
      scraped_biography.persist(idiomas_disponibles,prosa,human_tags) 
      reintentos = 2   

    rescue Exception => e
      puts "Exception scrape_biography_ted"
      puts e.backtrace.inspect
      puts e.message
      puts reintentos
      if reintentos > 0
        reintentos-=1
        sleep 2
        scrape_biography_ted(biography_url,1,reintentos)
      end
    end
    
  end #scrape_biography_ted
  
  

end