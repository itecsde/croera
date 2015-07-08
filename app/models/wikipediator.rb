# encoding: utf-8

class Wikipediator
  include ActionView::Helpers::SanitizeHelper
  
  # wikify recibe prosa y devuelve un array de tags
  
  def wikify(prose, wikipediator_ip = nil)
    begin 
      #prose.force_encoding('binary')
      if prose != nil
        prose=prose.truncate(8000)
      end  
      if wikipediator_ip == nil
        wikipediator_ip = get_wikipediator_server
      end
      url = "http://" + wikipediator_ip + "/wikipediaminer/services/wikify?source=" + URI.encode(prose.gsub(/[^0-9a-z:,. ]/i, ''))
      page = Nokogiri::XML(open(url))
      tags = page.xpath("//message/detectedTopics/detectedTopic")
      return tags
    rescue Exception => e
      puts e.backtrace.inspect
      puts e.message 
      puts "Exception in wikify"    
    end
  end #wikify
  
  def wikify_it(prose, wikipediator_ip = nil)
    begin
      if prose != nil
        prose=prose.truncate(8000)
      end
      if wikipediator_ip == nil
        wikipediator_ip = get_wikipediator_server
      end
      #url = "http://" + wikipediator_ip + "/wikipediaminer/services/wikify?source=" + URI.encode(prose.gsub(/[^0-9a-z:,. ]/i, ''))
      #url = "http://" + wikipediator_ip + "/wikipediaminer/services/wikify?source=" + URI.encode(prose.gsub(/[^0-9a-z:,. ]/i, '') + "&minProbability=0.01")
      url = "http://" + wikipediator_ip + "/wikipediaminer/services/wikify?source=" + URI.encode(prose + "&minProbability=0.01")
      page = Nokogiri::XML(open(url,:read_timeout => 20))
      entries = page.xpath("//message/detectedTopics/detectedTopic")      
      tags = Array.new
      entries.each do |entry|
        tags << {:name => entry['title'], :weight => entry['weight'], :wikipedia_article_id => entry['id']}
      end 
      return tags
    rescue Exception => e
      puts e.backtrace.inspect
      puts e.message 
      puts "Exception in wikify_it " + wikipediator_ip 
      raise "Wikipediator exeception in method wikify_it " + wikipediator_ip + e.message    
    end
  end
  
  def expand_it(annotation_id, wikipedia_article_id, expanded_concepts, wikipediator_ip = nil)
    begin
      if wikipediator_ip == nil
        wikipediator_ip = get_wikipediator_server
      end
      url = "http://" + wikipediator_ip + "/wikipediaminer/services/exploreArticle?id=" + wikipedia_article_id.to_s + "&outLinks=true&linkRelatedness=true&inLinks=true"
      page = Nokogiri::XML(open(url,:read_timeout => 20))
      entries = page.xpath("//message/outLinks/outLink")      
      expansions = Array.new
      entries.each do |entry|
        expansions << {:name => entry['title'], :relatedness => entry['relatedness'], :wikipedia_article_id => entry['id'], :expanded_from => annotation_id}
      end
      expansions = expansions.sort_by { |hsh| hsh[:relatedness] }
      expansions = expansions.reverse
      expansions = expansions[0..expanded_concepts-1]
      return expansions
    rescue Exception => e
      puts e.backtrace.inspect
      puts e.message 
      puts "Exception in expand_it " + wikipediator_ip 
      raise "Wikipediator exeception in method expand_it " + wikipediator_ip + e.message    
    end
  end
  
   
  def expand_it_incrementally(annotation_id, wikipedia_article_id, threshold_expanded_concept_relatedness, old_relatedness_threshold, expanding_more_concepts, wikipediator_ip = nil)
    begin
      if wikipediator_ip == nil
        wikipediator_ip = get_wikipediator_server
      end
      url = "http://" + wikipediator_ip + "/wikipediaminer/services/exploreArticle?id=" + wikipedia_article_id.to_s + "&outLinks=true&linkRelatedness=true&inLinks=true"
      page = Nokogiri::XML(open(url,:read_timeout => 20))
      entries = page.xpath("//message/outLinks/outLink")      
      expansions = Array.new
      entries.each do |entry|
        expansions << {:name => entry['title'], :relatedness => entry['relatedness'], :wikipedia_article_id => entry['id'], :expanded_from => annotation_id}
      end
      if expanding_more_concepts == 1
         expansions = expansions.select {|hsh| (hsh[:relatedness].to_f >= threshold_expanded_concept_relatedness.to_f)}
      elsif expanding_more_concepts == 0
         expansions = expansions.select {|hsh| (hsh[:relatedness].to_f >= threshold_expanded_concept_relatedness.to_f and hsh[:relatedness].to_f <= old_relatedness_threshold.to_f )}                  
      end
      return expansions
    rescue Exception => e
      puts e.backtrace.inspect
      puts e.message 
      puts "Exception in expand_it " + wikipediator_ip 
      raise "Wikipediator exeception in method expand_it " + wikipediator_ip + e.message    
    end
  end
    
  
  def suggest(array_ids)
    begin
        list_ids=array_ids.map { |id| id }.join(",")
        url = "http://"+get_wikipediator_server+"/wikipediaminer/services/suggest?queryTopics=" + list_ids
        page = Nokogiri::XML(open(url))
        categories = page.xpath("//message/suggestionCategories/suggestionCategory")
        array_categories=Array.new
        categories.each do |category|
          array_categories << {:id => category['id'],:title => category['title'],:weight => category['weight']}
        end
      return array_categories
    rescue Exception => e
      puts e.backtrace.inspect
      puts e.message 
      puts "Exception in suggest"      
    end
  end #suggest
  
  
  #Deveulve los articulos sugeridos mas relevantes
  def suggest_articles(array_ids)
    begin
        list_ids=array_ids.map { |id| id }.join(",")
        url = "http://"+get_wikipediator_server+"/wikipediaminer/services/suggest?queryTopics=" + list_ids
        page = Nokogiri::XML(open(url))
        articles = page.xpath("//message/suggestionCategories/suggestionCategory/suggestion")
        
        array_articles=Array.new
        articles.each do |article|
          array_articles << {:id => article['id'],:title => article['title'],:weight => article['weight']} 
        end
        
        uncategorized_articles = page.xpath("//message/uncategorizedSuggestions/suggestion")
        uncategorized_articles.each do |article|
          array_articles << {:id => article['id'],:title => article['title'],:weight => article['weight']}
        end                
        
        return array_articles.sort_by { |hsh| hsh[:weight] }.reverse.uniq { |x| x[:title] }.first(10)
           
    rescue Exception => e
      puts e.backtrace.inspect
      puts e.message 
      puts "Exception in suggest"      
    end
  end #suggest  
  
  
  
  
  def search(name)
    begin   
        url = "http://"+get_wikipediator_server+"/wikipediaminer/services/search?query=" + URI.encode(name)
        page = Nokogiri::XML(open(url))
        entries = page.xpath("//label/senses/sense")
      return entries
    rescue Exception => e
      puts e.backtrace.inspect
      puts e.message 
      puts "Exception in search"      
    end
  end #search
  
  def complex_search(text)
    begin   
        url = "http://"+get_wikipediator_server+"/wikipediaminer/services/search?complex=true&query=" + URI.encode(text)
        page = Nokogiri::XML(open(url))
        entries = page.xpath("//label/senses/sense[1]")
      return entries
    rescue Exception => e
      puts e.backtrace.inspect
      puts e.message 
      puts "Exception in complex_search"      
    end
  end #complex_search
  
  def complex_search_it(text, wikipediator_ip = nil)
    begin   
        if wikipediator_ip == nil
          wikipediator_ip = get_wikipediator_server
        end

        url = "http://" + wikipediator_ip + "/wikipediaminer/services/search?complex=true&query=" + URI.encode(text)
        page = Nokogiri::XML(open(url,:read_timeout => 20))
        labels = page.xpath("//label")
        filtered_labels = Array.new
        labels.each do |label|
          if label['linkProbability'].to_f > 0.01
            filtered_labels << label
          end
        end
        entries = Array.new
        filtered_labels.each do |filtered_label|
          entries << filtered_label.xpath(".//senses/sense[1]").first
        end
        tags = Array.new
        entries.each do |entry|
          tags << {:name => entry['title'], :weight => entry['weight'], :wikipedia_article_id => entry['id']}
        end
      return tags
    rescue Exception => e
      puts e.backtrace.inspect
      puts e.message 
      puts "Exception in complex_search_it "+ wikipediator_ip
      raise "Exception in complex_search_it " + wikipediator_ip
    end
  end #complex_search

  def compare(id1,id2, wikipediator_ip = nil)
     begin         
        if wikipediator_ip == nil
           wikipediator_ip = get_wikipediator_server
        end      
        url = "http://" + wikipediator_ip + "/wikipediaminer/services/compare?id1=" + id1.to_s + "&id2=" + id2.to_s        
        page = Nokogiri::XML(open(url,:read_timeout => 20))     
        relatedness = page.xpath("//message")[0]['relatedness']
        return relatedness                      
     rescue Exception => e
        puts "Exception in compare " + wikipediator_ip
        #puts id1
        #puts id2
        #puts url
        ##puts e.message
        #puts e.backtrace.inspect 
        #c = STDIN.getc.chr        
     end
  end



=begin  
  def compare(id1,id2, wikipediator_ip = nil, *reintentos)
     begin
        
         if reintentos[0]==1
            reintentos = reintentos[1].to_i
         else
            reintentos = 5
         end
        
        if wikipediator_ip == nil
           wikipediator_ip = get_wikipediator_server
        end
        
        url = "http://" + wikipediator_ip + "/wikipediaminer/services/compare?id1=" + id1.to_s + "&id2=" + id2.to_s
        
        page = Nokogiri::XML(open(url,:read_timeout => 20))
        
        relatedness = page.xpath("//message")[0]['relatedness']
        
        reintentos = 5
        return relatedness
                        
     rescue Exception => e
        puts "Exception in compare " + wikipediator_ip
        puts e.message
        puts e.backtrace.inspect
        puts reintentos
        if reintentos > 0
           reintentos-=1
           sleep 0.3
           compare(id1,id2,wikipediator_ip, 1, reintentos)
        end        
     end
  end
=end      
  def getDefinition(title)    
    begin   
        url = "http://"+get_wikipediator_server+"/wikipediaminer/services/exploreArticle?definition=true&definitionLength=long&title=" + URI.encode(title)
        page = Nokogiri::XML(open(url))
        definition = page.xpath("//definition")
        definition=strip_tags(definition.text)
      return definition
    rescue Exception => e
      puts e.backtrace.inspect
      puts e.message 
      puts "Exception in getDefinition"      
    end 
  end #getDefinition
  
  
  def translations(id)
    begin   
        url = "http://"+get_wikipediator_server+"/wikipediaminer/services/exploreArticle?id=" + id.to_s + "&translations=true"
        page = Nokogiri::XML(open(url))
        languages = page.xpath("//message/translations/tranlation")
      return languages
    rescue Exception => e
      puts e.backtrace.inspect
      puts e.message 
      puts "Exception in translations"      
    end
  end #translations
  
  def parentCategories(id)
    begin   
        url = "http://"+get_wikipediator_server+"/wikipediaminer/services/exploreArticle?id=" + id.to_s + "&parentCategories"
        page = Nokogiri::XML(open(url))
        parentCategories = page.xpath("//message/parentCategories/parentCategory")
      return parentCategories
    rescue Exception => e
      puts e.backtrace.inspect
      puts e.message 
      puts "Exception in parentCategories"      
    end
  end #parentCategories
  
  ####################################################################################
  ##### DEVUELVE UN ARRAY CON LAS URLS EN TODOS LOS IDIOMAS DE LA UE DISPONIBLES
  ##### DE UN PROGRAMA SOFTWARE DE LA WIKIPEDIA
  #######################################################
  
  def application_translation_urls(name)
    begin
      array_ids = []
      array_matches = []
      url_idiomas = []
      idiomas_ue = ["gl","de","bg","cs","hr","da","sk","sl","es","et","fi","fr","el","hu","en","ga","it","lv","lt","mt","nl","pl","pt","ro","sv","tr","no"]
      id=-1
      i=0
      matches = 0
      wikipediator = Wikipediator.new
      entries = wikipediator.search(name)      
      if entries.length!=0  
        if entries.length > 1
          entries.each do |entry|
            parent_categories = wikipediator.parentCategories(entry['id'])
            parent_categories.each do |parent_category|
              if ApplicationParentCategory.find_by_name(parent_category['title'])
                matches+=1
              end
            end
            if matches > 0
              array_ids << entry['id']
              array_matches << matches
              matches = 0
            end 
          end
          #obtenemos el mayor numero de matches
          maximo = array_matches.max
          if maximo != nil
            max_index = array_matches.index(maximo)
            #id es el identificador del elemento con mayor numero de matches
            id = array_ids[max_index]
          end     
        else
          parent_categories = wikipediator.parentCategories(entries[0]['id'])
          parent_categories.each do |parent_category|
            if ApplicationParentCategory.find_by_name(parent_category['title'])
              matches+=1
            end
          end
          if matches>0
            id = entries[0]['id']
          end
        end
        puts "Procedemos a obtener las url translations del id: " + id.to_s
        translations = wikipediator.translations(id)
        translations.each do |translation|
          if translation['lang'].in? idiomas_ue
            url_idioma = "http://" + translation['lang'] + ".wikipedia.org/wiki/" + translation.text
            url_idiomas << {:url => url_idioma, :lang => translation['lang']}
          end
        end      
      end
      return url_idiomas
    rescue Exception => e
      puts "Failed url_translations"
      puts e.message
      puts e.backtrace.inspect
    end
  end #application_translations_url
  
  ###############################################################################
  #### DEVUELVE UN ARRAY CON LAS URLS EN TODOS LOS IDIOMAS DE LA UE DISPONIBLES
  #### DEL NOMBRE name
  ##############################################################################
  
  def translations_urls(name)
    array_ids = []
    array_matches = []
    url_idiomas = []
    idiomas_ue = ["gl","de","bg","cs","hr","da","sk","sl","es","et","fi","fr","el","hu","en","ga","it","lv","lt","mt","nl","pl","pt","ro","sv","tr","no"]
    wikipediator = Wikipediator.new
    entries = wikipediator.search(name)
    if entries.length > 0   
      translations = wikipediator.translations(entries[0]['id'])
      translations.each do |translation|
        if translation['lang'].in? idiomas_ue
          url_idioma = "http://" + translation['lang'] + ".wikipedia.org/wiki/" + translation.text
          url_idiomas << {:url => url_idioma, :lang => translation['lang'], :name => translation.text}
        end
      end      
    end
    return url_idiomas
    #puts url_idiomas
  end
  
  
 
  def get_wikipediator_server    
    #ENV['RAILS_ENV'] == "development"
    #if Rails.env.development?
     # wiki_servers = ["192.168.1.82"]
    #else
      #wiki_servers = ["192.168.1.2","192.168.1.3","192.168.1.4","192.168.1.5","192.168.1.6"] 
    #end       
    
    #wiki_servers = ["192.168.1.8:8080","192.168.1.9:8080","192.168.1.10:8080","192.168.1.11:8080","192.168.1.12:8080"]
    #wiki_servers = ["193.146.210.107:8080","193.146.210.107:8081","193.146.210.107:8082"]
    #wiki_servers = ["192.168.1.8","192.168.1.9","192.168.1.10","192.168.1.11"]
    
    #wiki_servers = ["192.168.1.8:8080","192.168.1.9:8080","192.168.1.10:8080","192.168.1.11:8080","192.168.1.12:8080"]
    #wiki_servers = ["192.168.1.9:8080","192.168.1.10:8080","192.168.1.12:8080"]
    #wiki_servers = ["192.168.1.11:8080"]
    wiki_servers = ["192.168.1.8:8080"]
    
    actual_wiki_server = WikipediatorServerCounter.first
    if actual_wiki_server == nil
       new_wiki_server = WikipediatorServerCounter.new
       new_wiki_server.counter = 0
       new_wiki_server.server_ip = wiki_servers[0]
       new_wiki_server.save
       #puts "Wikipediador :" + new_wiki_server.server_ip
       return new_wiki_server.server_ip
    else 
      if (actual_wiki_server.counter + 1) >= wiki_servers.size
        actual_wiki_server.counter = 0
        actual_wiki_server.server_ip = wiki_servers[0]
      else
        actual_wiki_server.counter =  actual_wiki_server.counter + 1
        actual_wiki_server.server_ip =  wiki_servers[actual_wiki_server.counter]          
      end
      actual_wiki_server.save
      #puts "Wikipediador :" + actual_wiki_server.server_ip
      return actual_wiki_server.server_ip
    end
        
  end
  
  
  def self.spotlight_disambiguate(term,locale)
    begin
     url="http://localhost:2223/rest/candidates?text="+URI.encode(term.gsub(/[^0-9a-z:,. ]/i, ''))+"&confidence=0&support=0&spotter=Default&disambiguator=Default&policy=whitelist"    
     page = Nokogiri::XML(open(url))
     tags = page.xpath("//annotation/surfaceForm/resource")
     titles=Array.new
     tags.each do |tag|
        titles << tag['label']
     end     
     return titles
    rescue Exception => e
      puts e.backtrace.inspect
      puts e.message 
      puts "Exception in spotlight_disambiguate"    
    end    
  end
  
  
  ###########################################################################################
  #####################   PARA OTROS IDIOMAS CON LA API DE LA WIKIPEDIA   ###################
  ###########################################################################################
  
  def self.wikipedia_disambiguate(term,locale)
    begin
      url = "http://"+locale.to_s+".wikipedia.org/w/api.php?action=query&list=search&srprop=snippet&format=xml&srsearch="+URI.encode(term.gsub(/[^0-9a-z:,. ]/i, ''))
      puts url
      page = Nokogiri::XML(open(url))
      candidates = page.xpath("//api/query/search/p")
      puts candidates
      results=Array.new
      candidates.each do |candidate|
        results << [candidate['title'],candidate['snippet'],""]
      end
      return results
    rescue Exception => e
      puts e.backtrace.inspect
      puts e.message 
      puts "Exception in wikipedia_disambiguate"    
    end    
  end
  
  
  def self.wikipedia_get_article_image(term,locale)
    begin
        #La url comentada es de descripcion mas imagenes el caso es que imagenes muy desordenadas
        #http://en.wikipedia.org/w/api.php?action=query&prop=extracts|images&format=xml&exlimit=10&exintro=&explaintext=&exsectionformat=plain&&imlimit=100&titles=Nikola_Tesla
       url = "http://"+locale.to_s+".wikipedia.org/w/api.php?action=parse&format=xml&prop=images&page="+URI.encode(term)
       page = Nokogiri::XML(open(url))
       parsed_image = page.xpath("//api/parse/images/img[1]")
       #Obtuvimos un listado con las imagenes de la pagina     
       #Cogemos la primera eso no quiere decir que sea la principal pero no lo sabemos
       image_text = parsed_image[0].text
       imagewidth = 220
       diggest_image= Digest::MD5.hexdigest(image_text)
       url_encode = URI.encode(image_text)
       folder = diggest_image[0]+"/"+diggest_image[0..1]+"/"+url_encode+"/"+imagewidth.to_s+"px-"+url_encode               
       
       #url_wiki_thumbs="http://upload.wikimedia.org/wikipedia/"+locale.to_s+"/thumb/"
       url_wiki_thumbs="http://upload.wikimedia.org/wikipedia/commons/thumb/"
       
       return url_wiki_thumbs + folder
     rescue Exception => e
      puts e.backtrace.inspect
      puts e.message 
      puts "Exception in wikipedia_get_article_image"    
    end
  end
  
  
  def self.wikipedia_get_article_description(term,locale)
    begin
      url="http://"+locale.to_s+".wikipedia.org/w/api.php?action=query&prop=extracts&format=xml&exlimit=10&exintro=&explaintext=&exsectionformat=plain&redirect=&titles="+URI.encode(term)
      page = Nokogiri::XML(open(url))
      parsed_description = page.xpath("//api/query/pages/page/extract")
      return parsed_description[0].text
    rescue Exception => e
      puts e.backtrace.inspect
      puts e.message 
      puts "Exception in wikipedia_get_article_description"    
    end
  end
  
  
  def self.wikipedia_get_article_title_tranlation(term,from_locale,to_locale)
    begin
      #OBTENER TODOS LOS LANG DISPONIBLES: http://en.wikipedia.org/w/api.php?action=query&titles=Nikola Tesla&prop=langlinks&lllimit=500&format=xml
      url="http://"+from_locale.to_s+".wikipedia.org/w/api.php?action=query&prop=langlinks&lllang="+to_locale.to_s+"&format=xml&titles="+URI.encode(term)
      page = Nokogiri::XML(open(url))
      parsed_title = page.xpath("//api/query/pages/page/langlinks/ll")      
      return parsed_title[0].text
    rescue Exception => e
      #puts e.backtrace.inspect
      #puts e.message 
      puts "Exception in wikipedia_get_article_title_tranlation Article perhaps dont exist in English wikipedia"
      return nil        
    end
  end
  
  
  def self.wikipedia_get_available_article_translations(term)
    begin
      #OBTENER TODOS LOS LANG DISPONIBLES: http://en.wikipedia.org/w/api.php?action=query&titles=Nikola Tesla&prop=langlinks&lllimit=500&format=xml
      url="http://en.wikipedia.org/w/api.php?action=query&prop=langlinks&lllimit=500&format=xml&titles="+URI.encode(term)
      page = Nokogiri::XML(open(url))
      language_titles = page.xpath("//api/query/pages/page/langlinks/ll")
      results = Array.new
      language_titles.each do |lang_title|         
        results << [lang_title['lang'],lang_title.text]
      end            
      return results
    rescue Exception => e
      #puts e.backtrace.inspect
      #puts e.message 
      puts "Exception in wikipedia_get_available_article_translations Article perhaps dont exist in English wikipedia"
      return nil        
    end
  end
  
  
end
