idiomas_disponibles = Array.new
wikipediator = Wikipediator.new

tripadvisor_sites = Site.where('scraped_from LIKE ?', '%tripadvisor%').all

tripadvisor_sites.each do |site|
  if site.scraping_status.translated_by_wikipedia != true
    begin       
      I18n.locale = "en"
      english_link = site.link
      if site.description == "" or site.description == ""
        entries = wikipediator.search(site.name)     
        if entries.length > 0   
          entry_title = entries[0]['title']
          wikipedia_page = Nokogiri::HTML(open(URI.encode("http://en.wikipedia.org/wiki/" + entry_title)))
          description = ""
          wikipedia_page.css("div#mw-content-text p").each_with_index do |parrafo, index|
            if index < 3
              if !parrafo.text.include? "°" and !parrafo.text.include? "′" and !parrafo.text.include? "″"   
                description = description + parrafo.text
              end 
            end
          end  
          site.description = description.gsub(/\[.\]/, "") 
        end
      end      
      urls_translations = wikipediator.translations_urls(site.name)
      urls_translations.each do |url_translations|
        begin
          puts "Obteniendo informacion en idioma: " + url_translations[:lang]
          I18n.locale = url_translations[:lang]
          wikipedia_page = Nokogiri::HTML(open(URI.encode(url_translations[:url])))
          description = ""
          wikipedia_page.css("div#mw-content-text p").each_with_index do |parrafo, index|
            if index < 3
              if !parrafo.text.include? "°" and !parrafo.text.include? "′" and !parrafo.text.include? "″"   
                description = description + parrafo.text
              end
            end
          end        
          idiomas_disponibles << url_translations[:lang]
          site.description = description.gsub(/\[.\]/, "")
          site.name = url_translations[:name]
          site.link = english_link
        rescue Exception => e
          puts "Exceptions translation language => " + url_translations[:lang]
          puts e.message
          puts e.backtrace.inspect
        end
      end
      site.scraping_status.translated_by_wikipedia = true   
      site.scraping_status.save
      site.save
    rescue Exception => e
      puts "Exception translations populate_descriptions_and_translations_sites_tripadvisor"
      puts e.message
      puts e.backtrace.inspect
    end
  end
end #do |site|
