# encoding: utf-8

require 'capybara/rails'
require "capybara"
require "capybara/dsl"

class ScraperArticles
  include ActionView::Helpers::SanitizeHelper
  include Capybara::DSL
  
  ###############################################################
  #######  SCRAPE_SCIENCEDAILY
  ###############################################################

  def scrape_sciencedaily(*reintentos)
    begin
      url = "http://www.sciencedaily.com/"
      source_name = __method__.to_s    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Article", "http://www.sciencedaily.com/")
      
      if reintentos[0]==1
      reintentos = reintentos[1].to_i
      else
      reintentos = 2
      end
      i=0
      
      Nokogiri::HTML(open(url, "User-Agent" => "Ruby/#{RUBY_VERSION}"))
      page = Nokogiri::HTML(open(url, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:26.0) Gecko/20100101 Firefox/26.0"))
      reintentos = 2

      page.css("div.shortcuts div a").each_with_index do |category,index|
        if index != 0
          scrape_category_sciencedaily category['href'].gsub("/news/","").gsub("/","")
        end
      end
      source.correct_scrape
    rescue  Exception => e
      puts "Exception in scrape_sciencedaily"
      puts "Reintentamos dos veces, sino abortamos"
      puts e.backtrace.inspect
      puts e.message
      if reintentos > 0
        puts reintentos
        reintentos-=1
        sleep 2
        scrape_sciencedaily(1,reintentos)
      end
      source.incorrect_scrape
    end
  end

  def scrape_category_sciencedaily(category, *siguiente)
    begin
      if siguiente[1]==1
      reintentos = siguiente[2]
      else
      reintentos = 2
      end

      category_xml = "http://www.sciencedaily.com/xml/featured.php?top=&quirky=&section=" + category

      xml_page = Nokogiri::XML(open(category_xml))
      max_results = xml_page.xpath("//xml/maxresults").text
      puts max_results
      i=0
      num_start = 0
      num_end = 1000

      if siguiente[1]!=1
        category_xml = "http://www.sciencedaily.com/xml/featured.php?top=&quirky=&section=" + category + "&topic=&start=" + num_start.to_s + "&end=" + num_end.to_s
        xml_page = Nokogiri::XML(open(category_xml))
        reintentos = 2
        articles = xml_page.xpath("//xml/item/short")
        articles.each do |article|
          scrape_article_sciencedaily "http://www.sciencedaily.com" + article.text.split("href=")[1].split("class")[0].gsub('"','').strip
          puts i+=1
        end
        num_start = num_end
        num_end = num_end + 1000
        siguiente = "http://www.sciencedaily.com/xml/featured.php?top=&quirky=&section=" + category + "&topic=&start=" + num_start.to_s + "&end=" + num_end.to_s
      else
      siguiente = siguiente[0]
      end

      while siguiente != nil
        puts puts "XML_SIGUIENTE --> " + siguiente
        xml_page2 = Nokogiri::XML(open(siguiente))
        reintentos = 2

        articles = xml_page2.xpath("//xml/item/short")
        articles.each do |article|
         scrape_article_sciencedaily "http://www.sciencedaily.com" + article.text.split("href=")[1].split("class")[0].gsub('"','').strip
          puts i+=1
        end

        if num_end < max_results.to_i
          num_start = num_end
          num_end = num_end + 1000
          siguiente = "http://www.sciencedaily.com/xml/featured.php?top=&quirky=&section=" + category + "&topic=&start=" + num_start.to_s + "&end=" + num_end.to_s
        else
          siguiente = nil
        end
      end

    rescue  Exception => e
      puts "Exception in scrape_category_sciencedaily"
      puts "Reintentamos dos veces, sino saltamos de category"
      puts e.backtrace.inspect
      puts e.message
      if reintentos > 0
        puts reintentos
        reintentos-=1
        sleep 2
        scrape_category_sciencedaily(category,siguiente,1,reintentos)
      end
    end
  end

 def scrape_article_sciencedaily(article_url, *reintentos)
    begin
      scraped_article = Article.new
      human_tags = Array.new
      idiomas_disponibles = ["en"]
      scraped_from = "http://www.sciencedaily.com/"
      name = ""
      description = ""
      puts article_url

      if reintentos[0]==1
      reintentos = reintentos[1].to_i
      else
      reintentos = 2
      end

      article_page = Nokogiri::HTML(open(article_url))
      reintentos = 2

      begin
        name = article_page.css("div#content h1#headline.story")[0].text.strip
        puts "Name: " + name
      rescue
        puts "Failed Name sciencedaily"
      end
      
      summary = ""
      text = ""
      begin
        summary = article_page.css("div#content div div div#summary")[0].text.strip
        text = strip_tags article_page.css("div#content div#story div#text")[0].text.strip
        description = summary + "\n" + text
        #puts "Description: "
        #puts description
      rescue
        puts "Failed description sciencedaily"
      end

      begin
        article_page.css("div#related div#related_topics ul.black li a.blue").each do |related_topic|
          human_tags << related_topic.text.strip
        end
        article_page.css("div#related div#related_articles ul.black li a.blue").each do |related_article|
          human_tags << related_article.text.strip
        end
        #puts "human_tags: "
        #puts human_tags
      rescue Exception => e
        puts "Failed Tags sciencedaily"
        puts e.message
        puts e.backtrace.inspect
      end

      begin
        photo_url = article_page.css("div#story_photo div#photo_container div.triggers img.image")[0]['src']
        #puts "photo_url: " + photo_url
      rescue Exception => e
        puts "Failed Photo sciencedaily"
        #puts e.message
        #puts e.backtrace.inspect
        photo_url = nil
      end

      if photo_url!=nil
        begin
          a = URI.parse(photo_url)
          scraped_article.element_image=URI.parse(photo_url)
        rescue
          puts "sciencedaily: IMAGEN NO GUARDADA"
          scraped_article.element_image.clear
        end
      end

      I18n.locale = "en"
      scraped_article.name = name
      scraped_article.description = description
      scraped_article.url = article_url
      scraped_article.link = article_url
      scraped_article.scraped_from = scraped_from
      prosa = name + ". " + description
      scraped_article.persist(idiomas_disponibles,prosa,human_tags)

    rescue Exception => e
      puts "Exception in scrape_article_sciencedaily"
      puts "Reintentamos dos veces, sino saltamos al siguiente articulo"
      puts e.backtrace.inspect
      puts e.message
      if reintentos > 0
        puts reintentos
        reintentos-=1
        sleep 2
        scrape_article_sciencedaily(article_url,1,reintentos)
      end
    end
  end 
   
=begin  
  def scrape_rss_article(rss_feed, *reintentos)
    begin   
      article_name = ""
      info_to_wikify = ""    
      article_summary = ""
      article_content = ""    
      puts "RSS FEED " 
      puts rss_feed
      puts "FIN RSS FEED"
      idiomas_disponibles = []

      if reintentos[0]==1
        reintentos = reintentos[1].to_i
      else
        reintentos = 2
      end
  
      feed = Feedjira::Feed.fetch_and_parse(rss_feed,{ :max_redirects => 3 })
      html_page = Nokogiri::HTML(open(rss_feed))

      begin
        rss_feed_name = feed.title
        rss_feed_description = feed.description
        rss_feed_url_image = html_page.css("image url").text.strip
        puts rss_feed_url_image
        rss_feed_language = html_page.css("language").text.strip.split("-")[0]
        idiomas_disponibles << rss_feed_language
        puts rss_feed_language
      rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
      end
             
      source_name = rss_feed_name    
      #Add new source, or select it if exists
      source = Source.create_or_select_source(source_name, "Article", rss_feed)
      begin
        if rss_feed_url_image != nil          
          source.element_image = URI.parse(rss_feed_url_image)
          source.save
        end
      rescue
      end
             
      # Retrieves the articles, extracts the info, and saves them     
      feed.entries.each_with_index do |articles,index|
        begin
          if Article.where(:url => articles.url).size == 0
            scraped_article = Article.new
            begin
              puts index
              article_name = articles.title.strip
              article_summary = strip_tags articles.summary
              article_content = strip_tags articles.content
              article_url = articles.url
              article_publication_date = articles.published
            rescue Exception => e
              puts e.message
              puts e.backtrace.inspect
            end
                              
            return_values = extract_info_from_article(article_url, article_name)
            image_url = return_values[:image_url]
            info_to_wikify = return_values[:info_to_wikify]
            
            if image_url != nil          
              scraped_article.element_image = URI.parse(image_url)
            end
            
            I18n.locale = idiomas_disponibles[0]
            scraped_from = rss_feed
            scraped_article.name = article_name
            scraped_article.description = info_to_wikify
            scraped_article.publication_date = article_publication_date
            scraped_article.url = article_url
            scraped_article.link = article_url
            scraped_article.info_to_wikify = "" 
            if article_name != nil
              scraped_article.info_to_wikify = scraped_article.info_to_wikify + article_name
            end
            if info_to_wikify != nil
              scraped_article.info_to_wikify = scraped_article.info_to_wikify + info_to_wikify
            end
            scraped_article.scraped_from = scraped_from
            scraped_article.persist(idiomas_disponibles,scraped_article.info_to_wikify,[])
          else
            puts "article ya existente."
          end
        rescue Exception => e
          puts "Failed article"
          puts e.message
          puts e.backtrace.inspect
        end
      end 
      #After correct finish, store the source in sources
      source.correct_scrape
    rescue  Exception => e
      puts "Failed scrape_rss_article"
      puts e.message
      puts e.backtrace.inspect
      if reintentos > 0
        puts reintentos
        reintentos -= 1
        sleep 2
        scrape_rss_article(rss_feed, 1, reintentos)
      end
      source.incorrect_scrape
    end   
  end #scrape_rss_article
  
  def extract_info_from_article(article_url, article_title)
    return_values = Hash.new
    puts article_url
    puts article_title
    # Builds article object
    article_html = open(article_url,"User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:26.0) Gecko/20100101 Firefox/26.0").read
    article_html.gsub!("\n", "")
    article_object = Nokogiri::HTML(article_html)      
    # Cleans it
    article_object.at_css("body").traverse do |node|
      if node.text?
        node.content = node.content.gsub("\r", "")
        node.content = node.content.gsub("\n", "")
        node.content = node.content.gsub("\t", "")
        node.content = node.content.strip
      end
    end
    article_object.encoding = 'UTF-8'
    
    begin     
    # Finds nodes that contain post_title
    article_title_matches = article_object.css("body")[0].search('[text()="' + article_title.strip + '"]')
    rescue Exception => e
      puts "Failed matches article title"
      puts e.message
      puts e.backtrace.inspect
    end

    # Gets the most suitable node
    best_match = article_title_matches[0]
    puts best_match
    if article_title_matches[0].parent.name == "li" or article_title_matches[0].parent.parent.name == "li" or article_title_matches[0].parent.parent.parent.name == "li" 
      best_match = article_title_matches[1]
    end

    # Extracts a representative image and the content of the post
    if best_match != nil
      if !best_match.parent.css("img").empty?
        # Gets an array of images
        image_matches = best_match.parent.css("img")
        # Gets the first image with size higher than 2k
        image_url = first_big_image(article_url, image_matches)
        info_to_wikify = ""
        best_match.parent.css("p").each do |parrafo|
          if parrafo['class'] == nil          
            info_to_wikify = info_to_wikify + parrafo.text
          end
        end
      end
      if image_url == nil
        if !best_match.parent.parent.css("img").empty?
          # Gets an array of images
          image_matches = best_match.parent.parent.css("img")
          # Gets the first image with size higher than 2k
          image_url = first_big_image(article_url, image_matches)
          info_to_wikify = ""
          best_match.parent.parent.css("p").each do |parrafo|
            if parrafo['class'] == nil            
              info_to_wikify = info_to_wikify + parrafo.text
            end
          end
        end
        if image_url == nil
          if !best_match.parent.parent.parent.css("img").empty?
            # Gets an array of images
            image_matches = best_match.parent.parent.parent.css("img")
            info_to_wikify = strip_tags best_match.parent.parent.parent.text.gsub(/\n/," ").gsub(/\s+/,' ').gsub("&"," ").gsub("%"," ")
            # Gets the first image with size higher than 2k
            image_url = first_big_image(article_url, image_matches)
            info_to_wikify = ""
            best_match.parent.parent.parent.css("p").each do |parrafo|
              if parrafo['class'] == nil              
                info_to_wikify = info_to_wikify + parrafo.text
              end
            end
          end
        end
      end
      if info_to_wikify == "" or info_to_wikify == nil
        info_to_wikify = ""
        best_match.parent.css("p").each do |parrafo|
          if parrafo['class'] == nil
            info_to_wikify = info_to_wikify + parrafo.text
          end
        end
      end
      if info_to_wikify == "" or info_to_wikify == nil
        info_to_wikify = ""
        best_match.parent.parent.css("p").each do |parrafo|
          if parrafo['class'] == nil          
            info_to_wikify = info_to_wikify + parrafo.text
          end
        end
      end
      if info_to_wikify == "" or info_to_wikify == nil
        info_to_wikify = ""
        best_match.parent.parent.parent.css("p").each do |parrafo|
          if parrafo['class'] == nil          
            info_to_wikify = info_to_wikify + parrafo.text
          end
        end
      end         
    end
    return_values = {:image_url => image_url, :info_to_wikify => info_to_wikify}
  end
     
  def first_big_image(article_url, image_matches)
    begin
      image_url = nil
      image_matches.each do |match|
        dummy_article = Article.new
        # Builds the URL
        if match['src'] != nil
          url = match['src']
          if !match['src'].include? "http"
            url = "http://" + URI.parse(article_url).host + match['src']
          end
          # Parses it
          dummy_article.element_image = URI.parse(url)
          # Assigns the return value if the image is bigger than 2k
          if dummy_article.element_image.size > 2500
            image_url = url
            break
          end
        end
      end
      return image_url
    rescue Exception => e
      puts "Failed first_big_image"
      puts e.message
      puts e.backtrace.inspect
    end
  end
=end  
  
end