# encoding: utf-8

require 'capybara/rails'
require "capybara"
require "capybara/dsl"
require "mechanize"
require 'amazon/ecs'

class ScraperBooks
  include ActionView::Helpers::SanitizeHelper
  include Capybara::DSL
  
  #############################################################
  ####### SCRAPE_GUTENBERG
  ###########################################################
  def scrape_gutenberg (*siguiente)
    begin
      source_name = __method__.to_s    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Book", "http://www.gutenberg.org/")
      
      array_hashes = Array.new
      
      if siguiente[1]==1
        reintentos = siguiente[2]
      else
        reintentos = 2
      end    
      
      url = "http://www.gutenberg.org/browse/titles/a"
      page = Nokogiri::HTML(open(url))
      page_books_number = page.css("div.pgdbnavbar p")[2].css("a").each do |language|
         language_string = language.text
         language_locale = language['href'].split("/").last.strip
         language = { "language_string" => language_string, "language_locale" => language_locale }
         array_hashes << language
      end
      page_books_number = page.css("div.pgdbnavbar p")[3].css("a").each do |language|
         language_string = language.text
         language_locale = language['href'].split("/").last.strip
         language = { "language_string" => language_string, "language_locale" => language_locale }
         array_hashes << language
      end
        
      for i in 'a'..'z' do
         puts "Browse books by title: " + i.to_s
         url = "http://www.gutenberg.org/browse/titles/" + i.to_s
         page = Nokogiri::HTML(open(url))
         page_books_number = page.css("div.pgdbbytitle h2").size
         for j in 0..page_books_number-1 do
            book_name = page.css("div.pgdbbytitle h2 a")[j].to_s
            book_name = book_name.gsub("<br>"," ").split('>')[1].split("<")[0]
            language_string_to_search = page.css("div.pgdbbytitle h2 a")[j].next.text.strip.gsub("(","").gsub(")","")
            begin
               locale_found = array_hashes.find { |h| h["language_string"] == language_string_to_search }["language_locale"]
            rescue
               puts "Exception Locale"
            end
            book_author = page.css("div.pgdbbytitle p a")[j].text
            book_url = "http://www.gutenberg.org" + page.css("div.pgdbbytitle h2 a")[j]['href']
            scrape_book_gutenberg book_name, book_author, book_url, locale_found
         end
      end
      
      source.correct_scrape
    rescue  Exception => e
      puts "Exception in scrape_gutenberg"
      puts "Reintentamos dos veces, sino abortamos"
      puts e.backtrace.inspect
      puts e.message
      if reintentos > 0
        puts reintentos
        reintentos-=1
        sleep 2
        scrape_gutenberg(1,reintentos)
      end
      source.incorrect_scrape
    end
  end #scrape_gutenberg
  

   def scrape_book_gutenberg(name, author, book_url, language, *reintentos)
      begin
         description = ""         
         puts book_url
         idiomas_disponibles = Array.new
         manual_tags = Array.new
         idiomas_disponibles = Array.new

         if reintentos[0]==1
            reintentos = reintentos[1].to_i
         else
            reintentos = 2
         end

         scraped_book = Book.new

         description, photo_url = search_book_on_amazon(name + " " + author)
         
         #Give it another oportunity, only searching with the name
         if description == nil and photo_url == nil
            description, photo_url = search_book_on_amazon(name)
         end
         
         if description != nil or photo_url != nil                                           
            if description == nil
               description = ""
            end
               
            prosa = name + ". " + description
          
            begin
               author = author.split("(")[0].strip
               slices = author.split(",")
               author = slices[1] + " " + slices[0]
               author = author.strip
            rescue
               puts "Failed author"
            end
          
            manual_tags << author
            
            I18n.locale = language.to_s
            idiomas_disponibles << language.to_s
            scraped_from = "http://www.gutenberg.org"
            scraped_book.name = name
            scraped_book.author = author
            scraped_book.description = strip_tags description
            scraped_book.url = book_url
            scraped_book.link = book_url
            scraped_book.scraped_from = scraped_from
            if photo_url!=nil
               begin
                  scraped_book.element_image=URI.parse(photo_url)
               rescue Exception => e
                  puts e.message
                  puts e.backtrace.inspect
                  puts "book: IMAGEN NO GUARDADA"
                  scraped_book.element_image.clear
               end
            end
            scraped_book.persist(idiomas_disponibles, prosa, manual_tags)
         end
         reintentos = 2
      rescue Exception => e
         puts "Exception scrape_book_gutenberg"
         puts e.backtrace.inspect
         puts e.message
         puts reintentos
         if reintentos > 0
            reintentos-=1
            sleep 2
            scrape_book_gutenberg(name, author, book_url,1,reintentos)
         end
      end
   end #scrape_book_gutenberg
   
   
   def scrape_forgottenbooks(*siguiente)
      begin
         
         available_categories =  ['Fiction Books', 'Drama Books', 'Poetry Books', 'Folklore & Mythology Books', 'Esoteric Books', 'Self Help Books',
            'Philosophy Books', 'Religion Books', 'Ancient History Books', 'Medieval toEarly Modern History', 'Business & Economics Books', 
            'Science Books', 'Social Science Books', 'Technology & Engineering Books', 'Medicine Books', 'Mathematics Books', 'Art Books', 'Music Books', 'Recreation Books', 
            'Home & Household Books', 'Language Books', 'Biographies & Essays', 'Administrative Records', 'Miscellaneous Books', 'Foreign Language Books']
                     
         source_name = __method__.to_s    
         #Add new source, or select it if exists
         source = Source.create_or_select_source(source_name, "Book", "http://www.forgottenbooks.org/")
         
         parent_categories = Array.new
         
         if siguiente[1] == 1
           reintentos = siguiente[2]
         else
           reintentos = 2
         end    
         
         url = "http://www.forgottenbooks.org/"
         
         page = Nokogiri::HTML(open(url))
         
         page.css("div.grey ul#accordion-2.accordion li").each do |parent_category|
            if parent_category.css("a")[0]['href'] == "#"               
               parent_categories << parent_category
            end
         end
               
         parent_categories.each do |parent_category|
            scrape_parent_category_forgotten_books parent_category
         end
               
      source.correct_scrape
      rescue Exception => e
         puts "Exception scrape_forgottenbooks"
         puts e.message
         puts e.backtrace.inspect
         if reintentos > 0
           puts reintentos
           reintentos-=1
           sleep 2
           scrape_forgottenbooks(1,reintentos)
         end
         source.incorrect_scrape
       end
     end #scrape_forgottenbooks
     
     
   def scrape_parent_category_forgotten_books(parent_category, *siguiente)
      begin

         if siguiente[1]==1
            reintentos = siguiente[2]
         else
            reintentos = 2
         end
         
         parent_category.css("ul li a").each do |url|
            category_url = "http://www.forgottenbooks.org" + url['href']
            scrape_category_forgotten_books category_url
         end
         
      rescue Exception => e
         puts "Exception scrape_parent_category_forgotten_books"
         puts e.message
         puts e.backtrace.inspect
         if reintentos > 0
            puts reintentos
            reintentos-=1
            sleep 2
            scrape_parent_category_forgotten_books(parent_category, 1,reintentos)
         end
      end
   end #scrape_parent_category_forgotten_books   
   
   def scrape_category_forgotten_books(category_url, *siguiente)
      begin

         if siguiente[1]==1
            reintentos = siguiente[2]
         else
            reintentos = 2
         end

      puts category_url
      
      Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(app)
      end
      Capybara.javascript_driver = :selenium
      session = Capybara::Session.new(:selenium)   
      
      session.visit category_url
      
      page = Nokogiri::HTML(session.body)
      
      results_number = page.css("div#contentwrapper div#contentholder div h1")[0].text.split("(")[1].gsub("results)","").strip.to_i
            
      i = 0
      
      while i < results_number
         page.css("div#containmore div#topresults div#topresultsimg a")
         book = page.css("div#containmore div#topresults div#topresultsimg a")[i]
         i+=1
         puts i
         book_url = "http://www.forgottenbooks.org" + book['href']
         scrape_book_forgottenbooks book_url
         if (i % 25) == 0 
            session.find("a.load_more").click
            sleep 10
            page = Nokogiri::HTML(session.body)
         end
      end
         
      session.driver.browser.quit   
             
      rescue Exception => e
         puts "Exception scrape_category_forgotten_books"
         puts e.message
         puts e.backtrace.inspect
         if reintentos > 0
            puts reintentos
            reintentos-=1
            sleep 2
            scrape_category_forgotten_books(category_url, 1,reintentos)
         end
      end
   end #scrape_category_forgotten_books      
     
   def scrape_book_forgottenbooks(book_url, *reintentos)
      begin
         name = ""
         description = ""
         author = ""              
         puts book_url
         amazon_description = ""
         idiomas_disponibles = Array.new
         manual_tags = Array.new
         idiomas_disponibles = ['en']

         if reintentos[0]==1
            reintentos = reintentos[1].to_i
         else
            reintentos = 2
         end

         book_html_page = open(book_url, &:read)
         book_page = Nokogiri::HTML(book_html_page)

         scraped_book = Book.new

         begin
            name = book_page.css("div#contentholder h1")[0].text.strip
            puts "Name: " + name
         rescue
            puts "Exception name forgottenbooks"
         end
         
         begin
            author = book_page.css("div#contentholder p span[itemprop='author']")[0].text.strip
            puts author
         rescue
            puts "Exception author forgottenbooks"
         end          
                                        
         begin
            description = strip_tags book_page.css("div#contentholder div#overviewdesc span")[0].text.strip
         rescue
            puts "Exception description forgottenbooks"
         end         
                  
         begin
            page_photo_url = "http://www.forgottenbooks.org" + book_page.css("div#contentholder img.imgshadownohover")[0]['src']
         rescue
            puts "Exception photo_url forgottenbooks"
         end
      
         amazon_description, amazon_photo_url = search_book_on_amazon(name + " " + author)        
         
         if description == "" or description == nil
            description = amazon_description
         end
         
         photo_url = amazon_photo_url
         
         if photo_url == "" or photo_url == nil
            photo_url = page_photo_url 
         end          
                   
         manual_tags << author   
         
         if amazon_description == nil
            amazon_description = ""
         end   
         
         prosa = name + ". " + description + ". " + amazon_description
         
         I18n.locale = "en"
         scraped_from = "http://www.forgottenbooks.org"
         scraped_book.name = name
         scraped_book.author = author
         scraped_book.description = strip_tags description
         scraped_book.url = book_url
         scraped_book.link = book_url
         scraped_book.raw_html = book_html_page
         scraped_book.scraped_from = scraped_from

         if photo_url!=nil
            begin
               scraped_book.element_image=URI.parse(photo_url)
            rescue Exception => e
               puts e.message
               puts e.backtrace.inspect
               puts "book: IMAGEN NO GUARDADA"
               scraped_book.element_image.clear
            end
         end
         scraped_book.persist(idiomas_disponibles, prosa, manual_tags)
         reintentos = 2
      rescue Exception => e
         puts "Exception scrape_book_forgottenbooks"
         puts e.backtrace.inspect
         puts e.message
         puts reintentos
         if reintentos > 0
            reintentos-=1
            sleep 2
            if reintentos == 1
               puts "Sleeping for 60 seconds..."
               sleep 60
            end
            scrape_book_forgottenbooks(book_url,1,reintentos)
         end
      end
   end #scrape_book_forgottenbooks         
     
     
   def scrape_thegreatestbooks(*siguiente)
      begin
         urls = Array.new
         source_name = __method__.to_s
         #Add new source, or select it if exists
         source = Source.create_or_select_source(source_name, "Book", "http://thegreatestbooks.org/")

         parent_categories = Array.new

         if siguiente[1]==1
            reintentos = siguiente[2]
         else
            reintentos = 2
         end

         urls << "http://thegreatestbooks.org/"
         urls << "http://thegreatestbooks.org/nonfiction"
         
         urls.each do |url|
            puts url
            
            page = Nokogiri::HTML(open(url))
                           
            page.css(".item_list li.hentry h3.item_title a").each do |book|
               scrape_book_thegreatestbooks "http://www.thegreatestbooks.org" + book['href']
            end
            
            if !page.css("div.pagination a.next_page").empty?
               siguiente = "http://www.thegreatestbooks.org" + page.css("div.pagination a.next_page")[0]['href']
            else
               siguiente = nil
            end
   
            while siguiente != nil
               sleep 2
               puts "URL_SIGUIENTE --> " + siguiente
               page =  Nokogiri::HTML(open(siguiente))
               reintentos = 2
               page.css(".item_list li.hentry h3.item_title a").each do |book|
                  scrape_book_thegreatestbooks "http://www.thegreatestbooks.org" + book['href']
               end
              if !page.css("div.pagination a.next_page").empty?
                  siguiente = "http://www.thegreatestbooks.org" + page.css("div.pagination a.next_page")[0]['href']
               else
                  siguiente = nil
               end
            end
         end         
         source.correct_scrape   
      rescue Exception => e
         puts "Exception scrape_thegreatestbooks"
         puts e.message
         puts e.backtrace.inspect
         if reintentos > 0
            puts reintentos
            reintentos-=1
            sleep 2
            scrape_thegreatestbooks(1,reintentos)
         end
      source.incorrect_scrape
      end
   end #scrape_thegreatestbooks
     
           
   def scrape_book_thegreatestbooks(book_url, *reintentos)
      begin
         name = ""
         description = ""
         author = ""              
         puts book_url
         idiomas_disponibles = Array.new
         manual_tags = Array.new
         idiomas_disponibles = ['en']

         if reintentos[0]==1
            reintentos = reintentos[1].to_i
         else
            reintentos = 2
         end

         book_html_page = open(book_url, &:read)
         book_page = Nokogiri::HTML(book_html_page)

         scraped_book = Book.new

         begin
            name_and_author = book_page.css("div.container div.span-13 h2.alt")[0].text.strip
            puts name_and_author
            author = name_and_author.split("by").last.strip
            name =  name_and_author.gsub("by " + author,"").strip
            puts "Name: " + name
            puts "Author: " + author
         rescue
            puts "Exception name and author thegreatestbooks"
         end
                 
         begin
            description = book_page.css("div.container div.span-13 div.item_description")[0].text.strip
            description = description.gsub("- Wikipedia", "")
            puts "Description"
            puts description
         rescue
            puts "Exception description thegreatestbooks"
         end         
                  
         begin
            page_photo_url = "http://www.thegreatestbooks.org" + book_page.css("div.container div.span-13 div.item_image img")[0]['src']
            puts "photo_url"
            puts page_photo_url
         rescue
            puts "Exception photo_url thegreatestbooks"
         end
         
         amazon_description, amazon_photo_url = search_book_on_amazon(name + " " + author)
         
         if description == "" or description.include? "No Description" or description == nil
            description = amazon_description
         end
         
         photo_url = amazon_photo_url
         
         if photo_url == "" or photo_url == nil
            photo_url = page_photo_url 
         end          
            
         manual_tags << author   
            
         prosa = name + ". " + description + ". " + amazon_description
         
         I18n.locale = "en"
         scraped_from = "http://www.thegreatestbooks.org"
         scraped_book.name = name
         scraped_book.author = author
         scraped_book.description = description
         scraped_book.url = book_url
         scraped_book.link = book_url
         scraped_book.raw_html = book_html_page
         scraped_book.scraped_from = scraped_from

         if photo_url!=nil
            begin
               scraped_book.element_image=URI.parse(photo_url)
            rescue Exception => e
               puts e.message
               puts e.backtrace.inspect
               puts "book: IMAGEN NO GUARDADA"
               scraped_book.element_image.clear
            end
         end
         scraped_book.persist(idiomas_disponibles, prosa, manual_tags)
         reintentos = 2
      rescue Exception => e
         puts "Exception scrape_book_thegreatestbooks"
         puts e.backtrace.inspect
         puts e.message
         puts reintentos
         if reintentos > 0
            reintentos-=1
            sleep 2
            scrape_book_thegreatestbooks(book_url,1,reintentos)
         end
      end
   end #scrape_book_thegreatestbooks     
     
     
   
   def search_book_on_amazon(search_term)
      begin
         amazon_url = URI.encode("http://www.amazon.com/s/ref=nb_sb_noss_1?url=search-alias%3Dstripbooks&field-keywords=" + search_term)
         puts "Searching '" + search_term + "' in Amazon..."         
         amazon_page = Nokogiri::HTML(open(amazon_url))         
                                                                                                 
         book_url = ""                
         amazon_page.css("div#atfResults div").each do |result|
            if !result.css(".image a img")[0]['src'].include? "no-img"
               book_url = result.css(".image a")[0]['href']
               break
            end
         end          
         puts book_url         
         book_page = Nokogiri::HTML(open(book_url))
                                                                                     
         begin
           description = book_page.css("div#centerCol.centerColumn div#bookDescription_feature_div.feature noscript")[0].text.strip
         rescue Exception => e
            puts "Exception description amazon"
            puts e.message
         end
       
         begin
             photo_url = book_page.css("div#main-image-container.a-column div#img-wrapper.maintain-height div#img-canvas.maintain-height img")[0]['src']
         rescue Exception => e
            puts "Failed photo amazon"
            photo_url = nil
         end         
         
         if photo_url == nil
            begin
               photo_url = book_page.css("div#main-image-wrapper.main div#holderMainImage.holder img")[0]['src']   
            rescue
               puts "Failed photo amazon (2)"
            end
         end
         
         puts "Found!" 
         return description, photo_url
                 
      rescue Exception => e
         puts "Exception Amazon Search: Book not found"
         puts e.message
         description = nil
         photo_url = nil
         return description, photo_url
      end
   end 
   
   
   
end