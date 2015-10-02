# encoding: utf-8

require "nokogiri"
require "open-uri"
require 'capybara/rails'
require "capybara"
require "capybara/dsl"
require 'watir-webdriver'
require 'net/http'
require 'net/https'
require 'uri'
require 'mechanize'

class CorpusCreator
   include ActionView::Helpers::SanitizeHelper
  
  ###############################################################
  #######  create_corpus_reuters_21578
  ###############################################################

   def create_corpus_reuters_21578
      begin   
         for i in 0..21
            if i < 10             
               a = open('./corpus_reuters_21578/reut2-00' + i.to_s + '.sgm')
            else
               a = open('./corpus_reuters_21578/reut2-0' + i.to_s + '.sgm')
            end
            document = Nokogiri::HTML(a)
            document.css('reuters').each do |item|
               topics = ""
               places = ""    
               people = ""      
               orgs = ""     
               exchanges = ""
               companies = ""                
               name = item.css('title').text
               puts "Name: "
               puts name.strip
               date = item.css('date').text.strip
               dateline = item.css('dateline').text.strip
               description = item.css('text').text.gsub(name,"").gsub(dateline,"").strip
               
               item.css("topics").css("d").each do |topic|
                  topics = topics + "," + topic.text.strip
               end
               topics[0] = "" 
                     
               item.css("places").css("d").each do |place|
                  places = places + "," + place.text.strip
               end
               places[0] = ""               
                  
               item.css("people").css("d").each do |person|
                  people = people + "," + person.text.strip
               end
               people[0] = ""
                  
               item.css("orgs").css("d").each do |org|
                  org = orgs + "," + org.text.strip
               end
               orgs[0] = ""                          
     
               item.css("exchanges").css("d").each do |exchange|
                  exchanges = exchanges + "," + exchange.text.strip
               end
               exchanges[0] = ""               
                   
               item.css("companies").css("d").each do |company|
                  companies = companies + "," + company.text.strip
               end
               companies[0] = ""                          
                             
               has_topics = item['topics']               
               lewissplit = item['lewissplit']                            
               cgisplit = item['cgisplit']             
               old_id = item['oldid']             
               new_id = item['newid']          
               
               reuters_new_item = ReutersNewItem.new

               reuters_new_item.name = name
               reuters_new_item.description = description
               reuters_new_item.dateline = date
               reuters_new_item.has_topics = has_topics
               reuters_new_item.topics = topics
               reuters_new_item.places = places
               reuters_new_item.people = people
               reuters_new_item.orgs = orgs
               reuters_new_item.exchanges = exchanges
               reuters_new_item.companies = companies
               reuters_new_item.lewissplit = lewissplit
               reuters_new_item.cgisplit = cgisplit
               reuters_new_item.old_id = old_id
               reuters_new_item.new_id = new_id
              
               reuters_new_item.persist                                                                                              
            end 
         end
      rescue Exception => e
         puts "Exception create_corpus_reuters_21578"
         puts e.message
         puts e.backtrace.inspect
      end
   end
   
  ###############################################################
  #######  create_corpus_ohsumed
  ###############################################################

   def create_corpus_ohsumed
      begin
      categories_and_codes = Array.new 
      category_and_code = {:name => "Bacterial Infections and Mycoses", :code => "C01"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Virus Diseases", :code => "C02"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Parasitic Diseases", :code => "C03"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Neoplasms", :code => "C04"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Musculoskeletal Diseases", :code => "C05"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Digestive System Diseases", :code => "C06"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Stomatognathic Diseases", :code => "C07"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Respiratory Tract Diseases", :code => "C08"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Otorhinolaryngologic Diseases", :code => "C09"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Nervous System Diseases", :code => "C10"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Eye Diseases", :code => "C11"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Urologic and Male Genital Diseases", :code => "C12"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Female Genital Diseases and Pregnancy Complications", :code => "C13"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Cardiovascular Diseases", :code => "C14"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Hemic and Lymphatic Diseases", :code => "C15"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Neonatal Diseases and Abnormalities", :code => "C16"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Skin and Connective Tissue Diseases", :code => "C17"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Nutritional and Metabolic Diseases", :code => "C18"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Endocrine Diseases", :code => "C19"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Immunologic Diseases", :code => "C20"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Disorders of Environmental Origin", :code => "C21"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Animal Diseases", :code => "C22"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Pathological Conditions, Signs and Symptoms", :code => "C23"}
      categories_and_codes << category_and_code
                
         j=0
         for i in 1..23
            if i < 10
               Dir.chdir("/home/marcos/Documents/Aptana Studio 3 Workspace/iTEC-SDE/corpus_ohsumed_20000/test/C0" + i.to_s)  
               files = Dir.glob "*"
               files.each do |file|
                  file_id = file
                  file = File.new(file,"r")
                  description = file.read
                  description = description.gsub("%"," ").gsub("&"," ")
                  topic_code = 'C0' + i.to_s
                  topic = categories_and_codes.find {|h| h[:code] == topic_code }[:name]            
                  ohsumed_new_item = ReutersNewItem.new
                  ohsumed_new_item.description = description
                  ohsumed_new_item.cgisplit = "test"
                  ohsumed_new_item.topics = topic
                  ohsumed_new_item.file_id = file_id                  
                  ohsumed_new_item.persist
               end
            else
               Dir.chdir("/home/marcos/Documents/Aptana Studio 3 Workspace/iTEC-SDE/corpus_ohsumed_20000/test/C" + i.to_s)  
               files = Dir.glob "*"
               files.each do |file|
                  file_id = file
                  file = File.new(file,"r")
                  description = file.read
                  description = description.gsub("%"," ").gsub("&"," ")
                  topic_code = 'C' + i.to_s
                  topic = categories_and_codes.find {|h| h[:code] == topic_code }[:name]
                  ohsumed_new_item = ReutersNewItem.new
                  ohsumed_new_item.description = description
                  ohsumed_new_item.cgisplit = "test" 
                  ohsumed_new_item.topics = topic 
                  ohsumed_new_item.file_id = file_id                      
                  ohsumed_new_item.persist                
               end
            end
         end
         
         for i in 1..23
            if i < 10
               Dir.chdir("/home/marcos/Documents/Aptana Studio 3 Workspace/iTEC-SDE/corpus_ohsumed_20000/training/C0" + i.to_s)  
               files = Dir.glob "*"
               files.each do |file|
                  file_id = file                  
                  file = File.new(file,"r")
                  description = file.read
                  description = description.gsub("%"," ").gsub("&"," ")
                  topic_code = 'C0' + i.to_s
                  topic = categories_and_codes.find {|h| h[:code] == topic_code }[:name]
                  ohsumed_new_item = ReutersNewItem.new
                  ohsumed_new_item.description = descriptioncreate_rcv2_multilingual_corpus
                  ohsumed_new_item.cgisplit = "training" 
                  ohsumed_new_item.topics = topic
                  ohsumed_new_item.file_id = file_id                      
                  ohsumed_new_item.persist               
               end
            else
               Dir.chdir("/home/marcos/Documents/Aptana Studio 3 Workspace/iTEC-SDE/corpus_ohsumed_20000/training/C" + i.to_s)  
               files = Dir.glob "*"
               files.each do |file|
                  file_id = file
                  file = File.new(file,"r")
                  description = file.read
                  description = description.gsub("%"," ").gsub("&"," ")
                  topic_code = 'C' + i.to_s
                  topic = categories_and_codes.find {|h| h[:code] == topic_code }[:name]
                  ohsumed_new_item = ReutersNewItem.new
                  ohsumed_new_item.description = description
                  ohsumed_new_item.cgisplit = "training" 
                  ohsumed_new_item.topics = topic
                  ohsumed_new_item.file_id = file_id    
                  ohsumed_new_item.persist                
               end
            end
         end         
      rescue Exception => e
         puts "Exception create_corpus_ohsumed"
         puts e.message
         puts e.backtrace.inspect
      end
   end   
   
  ###############################################################
  #######  create_corpus_ohsumed_only_one_category
  ###############################################################

   def create_corpus_ohsumed_only_one_category
      begin
      categories_and_codes = Array.new 
      category_and_code = {:name => "Bacterial Infections and Mycoses", :code => "C01"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Virus Diseases", :code => "C02"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Parasitic Diseases", :code => "C03"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Neoplasms", :code => "C04"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Musculoskeletal Diseases", :code => "C05"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Digestive System Diseases", :code => "C06"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Stomatognathic Diseases", :code => "C07"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Respiratory Tract Diseases", :code => "C08"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Otorhinolaryngologic Diseases", :code => "C09"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Nervous System Diseases", :code => "C10"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Eye Diseases", :code => "C11"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Urologic and Male Genital Diseases", :code => "C12"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Female Genital Diseases and Pregnancy Complications", :code => "C13"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Cardiovascular Diseases", :code => "C14"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Hemic and Lymphatic Diseases", :code => "C15"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Neonatal Diseases and Abnormalities", :code => "C16"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Skin and Connective Tissue Diseases", :code => "C17"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Nutritional and Metabolic Diseases", :code => "C18"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Endocrine Diseases", :code => "C19"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Immunologic Diseases", :code => "C20"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Disorders of Environmental Origin", :code => "C21"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Animal Diseases", :code => "C22"}
      categories_and_codes << category_and_code
      category_and_code = {:name => "Pathological Conditions, Signs and Symptoms", :code => "C23"}
      categories_and_codes << category_and_code
                
         j=0
         for i in 1..23
            if i < 10
               Dir.chdir("/home/marcos/Documents/Aptana Studio 3 Workspace/iTEC-SDE/corpus_ohsumed_20000/test/C0" + i.to_s)  
               files = Dir.glob "*"
               files.each do |file|
                  file_id = file
                  file = File.new(file,"r")
                  description = file.read
                  description = description.gsub("%"," ").gsub("&"," ")
                  topic_code = 'C0' + i.to_s
                  topic = categories_and_codes.find {|h| h[:code] == topic_code }[:name]            
                  ohsumed_new_item = ReutersNewItem.new
                  ohsumed_new_item.description = description
                  ohsumed_new_item.cgisplit = "test"
                  ohsumed_new_item.topics = topic
                  ohsumed_new_item.file_id = file_id
                  ohsumed_new_item.persist
               end
            else
               Dir.chdir("/home/marcos/Documents/Aptana Studio 3 Workspace/iTEC-SDE/corpus_ohsumed_20000/test/C" + i.to_s)  
               files = Dir.glob "*"
               files.each do |file|
                  file_id = file
                  file = File.new(file,"r")
                  description = file.read
                  description = description.gsub("%"," ").gsub("&"," ")
                  topic_code = 'C' + i.to_s
                  topic = categories_and_codes.find {|h| h[:code] == topic_code }[:name]
                  ohsumed_new_item = ReutersNewItem.new
                  ohsumed_new_item.description = description
                  ohsumed_new_item.cgisplit = "test" 
                  ohsumed_new_item.topics = topic 
                  ohsumed_new_item.file_id = file_id                
                  ohsumed_new_item.persist                
               end
            end
         end
         
         for i in 1..23
            if i < 10
               Dir.chdir("/home/marcos/Documents/Aptana Studio 3 Workspace/iTEC-SDE/corpus_ohsumed_20000/training/C0" + i.to_s)  
               files = Dir.glob "*"
               files.each do |file|
                  file_id = file                  
                  file = File.new(file,"r")
                  description = file.read
                  description = description.gsub("%"," ").gsub("&"," ")
                  topic_code = 'C0' + i.to_s
                  topic = categories_and_codes.find {|h| h[:code] == topic_code }[:name]
                  ohsumed_new_item = ReutersNewItem.new
                  ohsumed_new_item.description = description
                  ohsumed_new_item.cgisplit = "training" 
                  ohsumed_new_item.topics = topic
                  ohsumed_new_item.file_id = file_id
                  ohsumed_new_item.persist               
               end
            else
               Dir.chdir("/home/marcos/Documents/Aptana Studio 3 Workspace/iTEC-SDE/corpus_ohsumed_20000/training/C" + i.to_s)  
               files = Dir.glob "*"
               files.each do |file|
                  file_id = file                  
                  file = File.new(file,"r")
                  description = file.read
                  description = description.gsub("%"," ").gsub("&"," ")
                  topic_code = 'C' + i.to_s
                  topic = categories_and_codes.find {|h| h[:code] == topic_code }[:name]
                  ohsumed_new_item = ReutersNewItem.new
                  ohsumed_new_item.description = description
                  ohsumed_new_item.cgisplit = "training" 
                  ohsumed_new_item.topics = topic 
                  ohsumed_new_item.file_id = file_id
                  ohsumed_new_item.persist                
               end
            end
         end         
      rescue Exception => e
         puts "Exception create_corpus_ohsumed_only_one_category"
         puts e.message
         puts e.backtrace.inspect
      end
   end      
   
   
  def delete_comma_category
     begin
        i = 0
        ReutersNewItem.where('topics like "Pathological Conditions, Signs and Symptoms"').each do |item|
           puts i+=1
           item.topics = item.topics.gsub("Pathological Conditions, Signs and Symptoms","Pathological Conditions and Signs and Symptoms")  
           item.save     
        end
        ReutersNewItem.where('topics like "%Congenital, Hereditary, and Neonatal Diseases and Abnormalities%"').each do |item|
           puts i+=1
           item.topics = item.topics.gsub("Congenital, Hereditary, and Neonatal Diseases and Abnormalities","Congenital Hereditary and Neonatal Diseases and Abnormalities")  
           item.save     
        end
     rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
     end
     
  end
   
  ###############################################################
  #######  create_corpus_20newsgroups_bydate
  ###############################################################

   def create_corpus_20newsgroups_bydate
      begin
         i=0              
         Dir.chdir("/home/marcos/Documents/Aptana Studio 3 Workspace/iTEC-SDE/20news-bydate/20news-bydate-test") 
         categories = Dir.glob "*"
         categories.each do |category|
            Dir.chdir("/home/marcos/Documents/Aptana Studio 3 Workspace/iTEC-SDE/20news-bydate/20news-bydate-test/" + category)
            files = Dir.glob "*"
            files.each do |file|
               puts i+=1
               file_id = file
               file = File.new(file,"r")
               puts category
               puts file_id
               description = file.read.encode("UTF-8", "binary", :invalid => :replace, :undef => :replace) 
               description = description.gsub("%"," ").gsub("&"," ")
               topic = category
               ohsumed_new_item = ReutersNewItem.new
               ohsumed_new_item.description = description
               ohsumed_new_item.cgisplit = "test"
               ohsumed_new_item.topics = topic
               ohsumed_new_item.file_id = file_id
               ohsumed_new_item.persist
            end
         end
     
         Dir.chdir("/home/marcos/Documents/Aptana Studio 3 Workspace/iTEC-SDE/20news-bydate/20news-bydate-train") 
         categories = Dir.glob "*"
         categories.each do |category|
            Dir.chdir("/home/marcos/Documents/Aptana Studio 3 Workspace/iTEC-SDE/20news-bydate/20news-bydate-train/" + category)
            files = Dir.glob "*"
            files.each do |file|
               puts i+=1       
               file_id = file
               file = File.new(file,"r")
               puts category
               puts file_id
               description = file.read.encode("UTF-8", "binary", :invalid => :replace, :undef => :replace)                       
               description = description.gsub("%"," ").gsub("&"," ")
               topic = category
               ohsumed_new_item = ReutersNewItem.new
               ohsumed_new_item.description = description
               ohsumed_new_item.cgisplit = "train"
               ohsumed_new_item.topics = topic
               ohsumed_new_item.file_id = file_id
               ohsumed_new_item.persist      
            end
         end       
      rescue Exception => e
         puts "Exception create_corpus_20newsgroups_bydate"
         puts e.message
         puts e.backtrace.inspect
      end
   end         
  
  
  ###############################################################
  #######  scrape_oercommons
  ###############################################################
   
   def scrape_oercommons(*reintentos)
      begin

         if reintentos[0]==1
            reintentos = reintentos[1].to_i
         else
            reintentos = 2
         end

         url = "https://www.oercommons.org/oer"

         nokogiri_html_page = Nokogiri::HTML(open(url, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0"))

         nokogiri_html_page.css("div.browse-materials table")[0].css("td")[0].css("li").each do |material_type|         
            scrape_material_type_oercommons material_type.css("a")[0]['href']
         end
         
      rescue  Exception => e
         puts "Exception in scrape_oercommons"
         puts "Reintentamos dos veces, sino abortamos"
         puts e.backtrace.inspect
         puts e.message
         if reintentos > 0
            puts reintentos
            reintentos-=1
            sleep 2
            scrape_oercommons(1,reintentos)
         end
      end
   end
  
 def scrape_material_type_oercommons(material_type_url, *reintentos)
      begin
         if reintentos[0]==1
         reintentos = reintentos[1].to_i
         else
         reintentos = 2
         end

         puts material_type_url
         
         material_type_page = Nokogiri::HTML(open(material_type_url, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0"))
         
         material_type_page.css("article.index-item").each do |article|
            if ReutersNewItem.where(:file_id => article.css(".item-link")[0]['href']).size == 0
               scrape_oer_oercommons article.css(".item-link")[0]['href']
            else
               puts "The resource is already stored in DB"
            end
         end

         if !material_type_page.css(".pagination li")[3].css("a").empty?
            siguiente = "https://www.oercommons.org" + material_type_page.css(".pagination li")[3].css("a")[0]['href']
         else
            siguiente = nil
         end

         while siguiente != nil
            sleep 2
            puts "URL_SIGUIENTE --> " + siguiente
            material_type_page =  Nokogiri::HTML(open(siguiente, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0"))
            reintentos = 2
            material_type_page.css("article.index-item").each do |article|
               if ReutersNewItem.where(:file_id => article.css(".item-link")[0]['href']).size == 0
                  scrape_oer_oercommons article.css(".item-link")[0]['href']
               else
                  puts "The resource is already stored in DB"
               end
            end
            if !material_type_page.css(".pagination li")[3].css("a").empty?
               siguiente = "https://www.oercommons.org" + material_type_page.css(".pagination li")[3].css("a")[0]['href']
            else
               siguiente = nil
            end
         end
      rescue  Exception => e
         puts "Exception in scrape_material_type_oercommons"
         puts "Reintentamos dos veces, sino abortamos"
         puts e.backtrace.inspect
         puts e.message
         if reintentos > 0
            puts reintentos
            reintentos-=1
            sleep 2
            scrape_material_type_oercommons(material_type_url,1,reintentos)
         end
      end
   end
  
   def scrape_oer_oercommons(oer_url, *reintentos)
      begin
                  
         name = ""
         description = ""
         puts oer_url
         manual_tags = Array.new
         subjects = Array.new
         

         if reintentos[0]==1
            reintentos = reintentos[1].to_i
         else
            reintentos = 2
         end

         oer_html_page = open(oer_url, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0", &:read)
         oer_page = Nokogiri::HTML(oer_html_page)

         begin
            language = oer_page.css(".item section.details div.information dl dd span[itemprop='inLanguage']")[0]['content']       
         rescue Exception => e
            puts e.message
            puts e.backtrace.inspect
            puts "Exception language oercommons"
         end
         
         if language == "en"
            scraped_oer = ReutersNewItem.new
   
            begin
               name = oer_page.css(".item section.details h1 a span")[0].text.strip
               puts "Name: " + name
            rescue
               puts "Exception name oercommons"
            end
   
            begin
               description = oer_page.css(".item section.details div.information dl dd.text[itemprop='description'] p").text       
            rescue
               puts "Exception description oercommons"
            end
            
            begin
               oer_page.css(".item section.details div.information dl dd span[itemprop='about']").each do |subject|
                  subjects << subject.text
               end       
            rescue Exception => e
               puts e.message
               puts e.backtrace.inspect
               puts "Exception subject oercommons"
            end
            
            subjects = subjects.join(",")
                              
            begin
               oer_page.css(".item-tags ul li").each do |tag|
                  manual_tags << tag.css("a")[0].text
               end 
            rescue Exception => e
               puts e.message
               puts e.backtrace.inspect
               puts "Exception subject oercommons"
            end
   
            prosa = name + ". " + description
            
            scraped_from = "https://www.oercommons.org/"
            scraped_oer.name = name
            scraped_oer.description = description
            scraped_oer.file_id = oer_url
            scraped_oer.topics = subjects
            scraped_oer.companies =  oer_html_page
            scraped_oer.persist(manual_tags)
            reintentos = 2
         end
      rescue Exception => e
         puts "Exception scrape_oer_oercommons"
         puts e.backtrace.inspect
         puts e.message
         puts reintentos
         if reintentos > 0
            reintentos-=1
            sleep 2
            scrape_oer_oercommons(oer_url,1,reintentos)
         end
      end
   end #scrape_oer_oercommons   
   
  
  def parse_metadata_oercommons
     begin
        tags = Array.new
        ReutersNewItem.where("id < 2900").each do |item|
           html_page = item.companies
           nokogiri_html_page = Nokogiri::HTML(html_page)
           File.open('oer.html', 'w') do |f2|
               f2.puts nokogiri_html_page
           end
           nokogiri_html_page.css("div.sidebar section.item-tags")[0].css("ul")[0].css("li").each do |tag|
              tags << tag.css("a").text
           end
           puts item.file_id
           puts tags
           tags.clear
        end
        puts ""
     rescue Exception => e
        puts "Exception parse_metadata_oercommons"
        puts e.message
        puts e.backtrace.inspect
     end
  end
   
   
   
   
  ###############################################################
  #######  scrape_merlot
  ###############################################################
  
   def scrape_merlot(*reintentos)
      begin

         if reintentos[0]==1
            reintentos = reintentos[1].to_i
         else
            reintentos = 2
         end

         categories = ["Academic Support Services ", "Arts ", "Business ", "Education ", "Humanities ", "Mathematics and Statistics ", "Science and Technology ","Social Sciences ", "Workforce Development "]
         scraped_categories = ["Academic Support Services ", "Arts ", "Business ", "Education ", "Humanities "]
         url = "http://www.merlot.org/merlot/materials.htm"

         nokogiri_html_page = Nokogiri::HTML(open(url, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0"))

         nokogiri_html_page.css("li.sarchFilterLevel1Li ul#categoriesList.searchFilterLayer2Ul li.searchFilterLevel2Li a").each do |category|
            category_name = category.text.strip.split("(")[0].strip
            category_url = "http://www.merlot.org" + category['href']
            if !scraped_categories.include? category_name
               scrape_category_merlot category_url              
            end

         end
         
      rescue  Exception => e
         puts "Exception in scrape_merlot"
         puts "Reintentamos dos veces, sino abortamos"
         puts e.backtrace.inspect
         puts e.message
         if reintentos > 0
            puts reintentos
            reintentos-=1
            sleep 2
            scrape_merlot(1,reintentos)
         end
      end
   end
   
   def scrape_category_merlot(category_url, *reintentos)
      begin
         if reintentos[0]==1
         reintentos = reintentos[1].to_i
         else
         reintentos = 2
         end

         puts category_url
         
         category_url = category_url.gsub("&nosearchlanguage=","")
         
         category_page = Nokogiri::HTML(open(category_url, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0"))
                  
         category_page.css("div.hitlistmaterial_tableless h3").each do |oer|
            oer_url = "http://www.merlot.org" + oer.css("span")[0].css("a")[0]['href']
            oer_id = oer_url.gsub("jsessionid=","").split("id=")[1].split("&hitlist")[0]
            if ReutersNewItem.where(:file_id => oer_id).size == 0
               scrape_oer_merlot oer_url
            else
               puts "The resource is already stored in DB"
            end
         end

         if !category_page.css("div#hitlistDetailDiv.hitlistDetailDiv div div a[aria-label='next page']").empty?
            siguiente = "http://www.merlot.org" + category_page.css("div#hitlistDetailDiv.hitlistDetailDiv div div a[aria-label='next page']")[0]['href']
            siguiente = siguiente.gsub("&nosearchlanguage=","")
         else
            siguiente = nil
         end

         while siguiente != nil
            sleep 2
            puts "URL_SIGUIENTE --> " + siguiente
            category_page =  Nokogiri::HTML(open(siguiente, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0"))
            reintentos = 2
            category_page.css("div.hitlistmaterial_tableless h3").each do |oer|
               oer_url = "http://www.merlot.org" + oer.css("span")[0].css("a")[0]['href']
               oer_id = oer_url.gsub("jsessionid=","").split("id=")[1].split("&hitlist")[0]
               if ReutersNewItem.where(:file_id => oer_id).size == 0
                  scrape_oer_merlot oer_url
               else
                  puts "The resource is already stored in DB"
               end
            end
            if !category_page.css("div#hitlistDetailDiv.hitlistDetailDiv div div a[aria-label='next page']").empty?
               siguiente = "http://www.merlot.org" + category_page.css("div#hitlistDetailDiv.hitlistDetailDiv div div a[aria-label='next page']")[0]['href']
               siguiente = siguiente.gsub("&nosearchlanguage=","")
            else
               siguiente = nil
            end
         end
      rescue  Exception => e
         puts "Exception in scrape_category_merlot"
         puts "Reintentamos dos veces, sino abortamos"
         puts e.backtrace.inspect
         puts e.message
         if reintentos > 0
            puts reintentos
            reintentos-=1
            sleep 2
            scrape_category_merlot(category_url,1,reintentos)
         end
      end
   end
   
   def scrape_oer_merlot(oer_url, *reintentos)
      begin
                  
         name = ""
         description = ""
         puts oer_url
         manual_tags = Array.new       
         categories = Array.new
         
         oer_url = oer_url.gsub("&nosearchlanguage=","")
         
         oer_id = oer_url.gsub("jsessionid=","").split("id=")[1].split("&hitlist")[0]

         if reintentos[0]==1
            reintentos = reintentos[1].to_i
         else
            reintentos = 2
         end

         oer_html_page = open(oer_url, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0", &:read)
         oer_page = Nokogiri::HTML(oer_html_page)

         
         scraped_oer = ReutersNewItem.new

         begin
            name = oer_page.css("span.material_tile_header_text")[0].text.strip
            puts "Name: " + name
         rescue
            puts "Exception name merlot"
         end

         begin
            description = oer_page.css("div#descriptionall.lightbox_message div[itemprop='description']").text
            puts "Description: " + description
         rescue
            puts "Exception description merlot"
         end
                                 
         begin
            oer_page.css("div.material_tile_body ul.md_links_list li").each do |category_item|
               category = category_item.css("span")[0].css("a span").text.strip
               categories << category
            end
            categories = categories.uniq
            categories = categories.join(",")
         rescue
            puts "Exception categories merlot"
         end                                 
                                 
         begin
            tags = oer_page.css("div#keywords_div span").text.strip.gsub("Keywords:","").strip
            tags.split(",").each do |tag|
               manual_tags << tag.strip
            end 
         rescue Exception => e
            puts e.message
            puts e.backtrace.inspect
            puts "Exception manual tags merlot"
         end
         
         scraped_from = "https://www.merlot.org/"
         scraped_oer.name = name
         scraped_oer.description = description
         scraped_oer.file_id = oer_id
         scraped_oer.topics = categories
         scraped_oer.companies =  oer_html_page
         scraped_oer.persist(manual_tags)
         reintentos = 2
      rescue Exception => e
         puts "Exception scrape_oer_merlot"
         puts e.backtrace.inspect
         puts e.message
         puts reintentos
         if reintentos > 0
            reintentos-=1
            sleep 2
            scrape_oer_merlot(oer_url,1,reintentos)
         end
      end
   end #scrape_oer_merlot   
   
   def detect_language_merlot
      begin
         ReutersNewItem.where(:places => nil).each do |item|
            language = item.description.language
            puts item.id
            puts item.file_id
            puts item.description
            puts language
            item.places = language
            item.save
         end
      rescue Exception => e
         puts "Exception detecting language MERLOT"
         puts e.message
         puts e.backtrace.inspect
      end
   end
   
   
   def export_reuters_27000_corpora_to_json
      begin
         i=0
         array_tags = Array.new
         Report.all.each do |report|
            array_tags.clear
            puts i+=1 
            if report.scraped_from == "http://www.reuters.com/news/archive/healthNews?view=page&pageSize=10&page="
               category = "Health"
               elsif report.scraped_from == "http://www.reuters.com/news/archive/artsNews?view=page&pageSize=10&page="
                  category = "Art"
               elsif report.scraped_from == "http://www.reuters.com/news/archive/politicsNews?view=page&pageSize=10&page="
                  category = "Politics"
               elsif report.scraped_from == "http://www.reuters.com/news/archive/sportsNews?view=page&pageSize=10&page="
                        category = "Sport"
               elsif report.scraped_from == "http://www.reuters.com/news/archive/scienceNews?view=page&pageSize=10&page="
                     category = "Science"
               elsif report.scraped_from == "http://www.reuters.com/news/archive/technologyNews?view=page&pageSize=10&page="
                     category = "Technology"
               elsif report.scraped_from == "http://www.reuters.com/news/archive/GCA-Economy2010?view=page&pageSize=10&page="
                     category = "Economy"
               elsif report.scraped_from == "http://www.reuters.com/news/archive/businessNews?view=page&pageSize=10&page="
                     category = "Business"
            end
            item = {:id => report.id,
                    :article_news_title => report.name,
                    :article_news_abstract => report.abstract,
                    :article_news_body => report.description,
                    :article_news_url => report.url,
                    :article_news_category => category}
            report.taggable_tag_annotations.each do |tag|
               tag_item = {:name => tag.tag.name,
                  :weight => tag.weight,
                  :wikipedia_article => "http://en.wikipedia.org/wiki/" + tag.tag.name.gsub(" ","_")}
               array_tags << tag_item
            end
            item[:annotations] = array_tags
            File.open('reuters_27000/' + report.id.to_s + '.json', 'w') do |f2|    
               f2.puts JSON.generate(item)              
            end  
         end
      rescue Exception => e
         puts "Exception export_reuters_27000_corpora_to_json"
         puts e.message
         puts e.backtrace.inspect
      end
   end
   
   def obtain_mesh_categories
      begin
         url_mesh_categories = "http://www.ncbi.nlm.nih.gov/mesh/1000067"
         nokogiri_html_page = Nokogiri::HTML(open(url_mesh_categories, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0"))
         mesh_categories = Array.new
         nokogiri_html_page.css("div.rprt.abstract ul ul ul").each do |mesh_category|        
            if !mesh_category.css("ul").empty?
               mesh_categories << mesh_category.css("a")[0].text
            end 
         end
         return mesh_categories
      rescue Exception => e
         puts "Exception obtain_mesh_categories"
         puts e.messageRe
         puts e.backtrace.inspect
      end
   end
   
   def create_uvigomed_corpus(deadline)
      begin         
         mesh_categories = obtain_mesh_categories         
         
         mesh_categories = ["Disorders of Environmental Origin", "Musculoskeletal Diseases", "Skin and Connective Tissue Diseases"]
         
         mesh_categories.each do |mesh_category|
            status = scrape_category_pubmed mesh_category, deadline
            if status == "deadline"
               puts "Deadline alcanzado en create_uvigomed_corpus"
            end     
         end
      rescue Exception => e
         puts "Exception create_uvigomed_corpus"
         puts e.message
         puts e.backtrace.inspect
      end
   end
   
   
   def scrape_category_pubmed(mesh_category, deadline)
      begin
         Capybara.register_driver :selenium do |app|
           Capybara::Selenium::Driver.new(app)
         end
         Capybara.javascript_driver = :selenium
         session = Capybara::Session.new(:selenium)   
                 
         puts "Scraping " + mesh_category + " category"
         url_search_pubmed = URI.encode('http://www.ncbi.nlm.nih.gov/pubmed/?term="' + mesh_category + '"[Mesh]')           
         session.visit(url_search_pubmed)
         session.click_link "EntrezSystem2.PEntrez.PubMed.Pubmed_ResultsPanel.Pubmed_DisplayBar.Display"
         sleep 2
         session.choose "PublicationDate"
         sleep 2
         session.click_button "Apply"
         sleep 2
         while 1               
            nokogiri_html_page = Nokogiri::HTML(session.body)
            nokogiri_html_page.css("div#maincontent.col.seven_col div.content div div.rprt div.rslt p.title a").each do |pubmed_article|
               url_pubmed_article = "http://www.ncbi.nlm.nih.gov" + pubmed_article['href']
               status = scrape_article_pubmed url_pubmed_article, mesh_category, deadline
               if status == "scraped"
                  #no hacemos nada, continua la ejecucion                   
               elsif status == "no_abstract"
                  #no hacemos nada, continua la ejecucion
               elsif status == "deadline"
                  puts "Deadline alcanzado en scrape_category"
                  session.driver.browser.quit  
                  return "deadline"
               end
            end
            session.click_on "Next >"
         end
                                   
      rescue Exception  => e
         puts "Exception create_uvigomed_corpus"
         puts e.message
         puts e.backtrace.inspect
      end
   end
   
   def scrape_article_pubmed(url_pubmed_article, mesh_category, deadline)
      begin
         scraped_article = ReutersNewItem.new
         nokogiri_html_page = Nokogiri::HTML(open(url_pubmed_article, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0"))       
                      
         #Obtenemos el xml del artículo
         nokogiri_xml_page = Nokogiri::HTML(open(url_pubmed_article + "?report=xml&format=text", "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0"))
         body = nokogiri_xml_page.css("html body").text
         #Lo convertimos a un Hash
         xml_hash = Hash.from_xml(body.gsub("\n",""))
         #Lo serializamos para guardarlo en db
         serialized_hash_xml_article = xml_hash.to_yaml
               
         day = xml_hash["PubmedArticle"]["MedlineCitation"]["DateCreated"]["Day"] 
         month = xml_hash["PubmedArticle"]["MedlineCitation"]["DateCreated"]["Month"] 
         year = xml_hash["PubmedArticle"]["MedlineCitation"]["DateCreated"]["Year"]               
         date = year + "-" + month + "-" + day
         date = Date.parse(date)
         puts "Date: " + date.to_s
         if date < Date.parse(deadline)
            puts "Deadline alcanzado"
            return "deadline"
         end
         
         if !nokogiri_html_page.css("div.content div.rprt_all div.rprt.abstract div.abstr").empty?             
            title = nokogiri_html_page.css("div.content div.rprt_all div.rprt.abstract h1").text.strip
            abstract = ""
            nokogiri_html_page.css("div.content div.rprt_all div.rprt.abstract div.abstr div abstracttext").each do |abstract_paragraph|
               abstract = abstract + abstract_paragraph.text
            end
            puts "TITLE: " + title
            puts 
            scraped_article.name = title
            scraped_article.description = abstract
            scraped_article.topics = mesh_category
            scraped_article.file_id = url_pubmed_article
            scraped_article.companies = serialized_hash_xml_article
            scraped_article.dateline = date
            scraped_article.persist
            return "scraped"
         else
            puts "No abstract"
            return "no_abstract"
         end
                   
      rescue Exception => e
         puts "Exception scrape_article_pubmed"
         puts e.message
         puts e.backtrace.inspect
      end
   end
   
   def uvigomed
      begin
         
         mesh_categories = ["Animal Diseases", "Bacterial Infections and Mycoses", "Cardiovascular Diseases", "Chemically-Induced Disorders", "Congenital Hereditary and Neonatal Diseases and Abnormalities", 
         "Digestive System Diseases", "Disorders of Environmental Origin", "Endocrine System Diseases", "Eye Diseases", "Female Urogenital Diseases and Pregnancy Complications", 
         "Hemic and Lymphatic Diseases", "Immune System Diseases", "Male Urogenital Diseases", "Musculoskeletal Diseases", "Neoplasms", "Nervous System Diseases", "Nutritional and Metabolic Diseases", 
         "Occupational Diseases", "Otorhinolaryngologic Diseases", "Parasitic Diseases", "Pathological Conditions and Signs and Symptoms", "Respiratory Tract Diseases", "Skin and Connective Tissue Diseases", 
         "Stomatognathic Diseases", "Virus Diseases", "Wounds and Injuries"]          
         mesh_categories.each do |mesh_category|
            puts "Category Name: " + mesh_category.to_s
            if ReutersNewItem.where("topics like '%" + mesh_category + "%'") != nil
               puts "Elementos con la categoria " + mesh_category + ": " + ReutersNewItem.where("topics like '%" + mesh_category + "%'").size.to_s
               puts 
            end
=begin            if ReutersNewItem.where("topics like '" + mesh_category + "'") != nil
               puts "Elementos unicamente con la categoria " + mesh_category + ": " + ReutersNewItem.where("topics like '" + mesh_category + "'").size.to_s
            end           
            puts ""
=end            
         end
      rescue Exception => e
         puts e.message
         puts e.backtrace.inspect
      end
   end
      
      
def split_uvigomed_test
   begin
      i = 0
      while i < 18532
         id = (120 + rand(92781))
         if (ReutersNewItem.where(:id => id).size != 0) and (ReutersNewItem.where(:id => id)[0].cgisplit == nil)
            puts "Marcando como test el elemento con id " + id.to_s
            item = ReutersNewItem.find_by_id(id)
            puts i+=1
            item.cgisplit = "test"
            puts "Guardando el elemento en la base de datos"
            item.save
         end
      end
   rescue Exception => e
      puts "Exception_split_uvigomed_test"
      puts e.message
      puts e.backtrace.inspect
   end
end

def split_uvigomed_train
   begin 
      i=0
      ReutersNewItem.where(:cgisplit => nil).each do |item|
         i += 1
         item.cgisplit = "train"
         puts "Marcando como train el elemento con id " + item.id.to_s
         puts "elemento numero " + i.to_s + " marcado"
         item.save
      end
   rescue Exception => e
      puts e.message
      puts e.backtrace.inspect
   end
end
      
      
      
def split_uvigomed_single_label_test
   begin
      i = 0
      while i < 10971
         id = (127 + rand(92781))
         if (ReutersNewItem.where(:id => id).size != 0) and (ReutersNewItem.where(:id => id)[0].cgisplit == nil)
            puts "Marcando como test el elemento con id " + id.to_s
            item = ReutersNewItem.find_by_id(id)
            puts i+=1
            item.cgisplit = "test"
            puts "Guardando el elemento en la base de datos"
            item.save
         end
      end
   rescue Exception => e
      puts "Exception_split_uvigomed_test"
      puts e.message
      puts e.backtrace.inspect
   end
end

def split_uvigomed_single_label_train
   begin 
      i=0
      ReutersNewItem.where(:cgisplit => nil).each do |item|
         i += 1
         item.cgisplit = "train"
         puts "Marcando como train el elemento con id " + item.id.to_s
         puts "elemento numero " + i.to_s + " marcado"
         item.save
      end
   rescue Exception => e
      puts e.message
      puts e.backtrace.inspect
   end
end

def randomized_split_ohsumed_single_label_test
   begin
      i = 0
      while i < 1807
         id = (7 + rand(16101))
         if (ReutersNewItem.where(:id => id).size != 0) and (ReutersNewItem.where(:id => id)[0].cgisplit == nil)
            puts "Marcando como test el elemento con id " + id.to_s
            item = ReutersNewItem.find_by_id(id)
            puts i+=1
            item.cgisplit = "test"
            puts "Guardando el elemento en la base de datos"
            item.save
         end
      end
   rescue Exception => e
      puts "Exception_randomized_split_ohsumed_single_label_test"
      puts e.message
      puts e.backtrace.inspect
   end
end

def randomized_split_ohsumed_single_label_train
   begin 
      i=0
      ReutersNewItem.where(:cgisplit => nil).each do |item|
         i += 1
         item.cgisplit = "train"
         puts "Marcando como train el elemento con id " + item.id.to_s
         puts "elemento numero " + i.to_s + " marcado"
         item.save
      end
   rescue Exception => e
      puts e.message
      puts e.backtrace.inspect
   end
end
          
def randomized_split_ohsumed_multi_label_test
   begin
      i = 0
      while i < 4633
         id = (557 + rand(23722))
         if (ReutersNewItem.where(:id => id).size != 0) and (ReutersNewItem.where(:id => id)[0].cgisplit == nil)
            puts "Marcando como test el elemento con id " + id.to_s
            item = ReutersNewItem.find_by_id(id)
            puts i+=1
            item.cgisplit = "test"
            puts "Guardando el elemento en la base de datos"
            item.save
         end
      end
   rescue Exception => e
      puts "Exception_randomized_split_ohsumed_multi_label_test"
      puts e.message
      puts e.backtrace.inspect
   end
end

def randomized_split_ohsumed_multi_label_train
   begin 
      i=0
      ReutersNewItem.where(:cgisplit => nil).each do |item|
         i += 1
         item.cgisplit = "train"
         puts "Marcando como train el elemento con id " + item.id.to_s
         puts "elemento numero " + i.to_s + " marcado"
         item.save
      end
   rescue Exception => e
      puts e.message
      puts e.backtrace.inspect
   end
end
 
def export_uvigomed_corpus_to_json
      begin
         i=0
         array_tags = Array.new
         ReutersNewItem.where('id > 88078').each do |report|
            array_tags.clear
            puts report.id
            item = {:id => report.id,
                    :title => report.name,
                    :abstract => report.description,
                    :date => report.dateline,
                    :categories => report.topics,
                    :split => report.cgisplit,
                    :url => report.file_id
                    }
            report.taggable_tag_annotations.each do |tag|
               tag_item = {:name => tag.tag.name,
                  :weight => tag.weight,
                  :wikipedia_article => "http://en.wikipedia.org/wiki/" + tag.tag.name.gsub(" ","_")}
               array_tags << tag_item
            end
            item[:annotations] = array_tags
            if report.cgisplit == "train"
               File.open('UVigoMED/multi_label/train/' + report.id.to_s + '.json', 'w') do |f2|    
                  f2.puts JSON.generate(item)              
               end
            elsif report.cgisplit == "test"
               File.open('UVigoMED/multi_label/test/' + report.id.to_s + '.json', 'w') do |f2|    
                  f2.puts JSON.generate(item)              
               end
            end           
            if !report.topics.include? ","
               if report.cgisplit == "train"
               File.open('UVigoMED/single_label/train/' + report.id.to_s + '.json', 'w') do |f2|    
                  f2.puts JSON.generate(item)              
               end
               elsif report.cgisplit == "test"
                  File.open('UVigoMED/single_label/test/' + report.id.to_s + '.json', 'w') do |f2|    
                     f2.puts JSON.generate(item)              
                  end
               end
            end           
         end
      rescue Exception => e
         puts "Exception export_uvigomed_corpus_to_json"
         puts e.message
         puts e.backtrace.inspect
      end
   end
   
   def create_rcv2_multilingual_spanish_corpus
      begin
         i=0           
         topics = ""
         Dir.chdir("/home/marcos/RCV2_Multilingual_Corpus/spanish")
         folders = Dir.glob "*"
         puts folders
         folders.each do |folder|
            Dir.chdir("/home/marcos/RCV2_Multilingual_Corpus/spanish/" + folder)
            files = Dir.glob "*"
            files.each do |file|
               reuters_new_item = ReutersNewItem.new
               topics.clear
               puts i+=1
               puts file
               xml_page = Nokogiri::XML(open(file))               
               title = xml_page.xpath("//newsitem/headline").text
               text = xml_page.xpath("//newsitem/text").text
               date = xml_page.xpath("//newsitem")[0]['date']
               codes = xml_page.xpath("//newsitem/metadata/codes")
               codes.each do |code|
                  if code['class'] == "bip:topics:1.0"
                     categories = code.xpath("code")
                     categories.each do |category|
                        category = category['code']
                        topics = topics + ',' + category 
                     end
                  end
               end
               topics[0]=""
               reuters_new_item.name = title
               reuters_new_item.description = text
               reuters_new_item.topics = topics
               reuters_new_item.dateline = date
               reuters_new_item.file_id = file               
               reuters_new_item.persist
            end
         end
      rescue Exception => e
         puts "Exception create_rcv2_multilingual_corpus"
         puts e.message
         puts e.backtrace.inspect
      end
   end
   
   
   def create_rcv2_multilingual_english_corpus
      begin
         i=0           
         topics = ""
         Dir.chdir("/home/marcos/rcv1")
         folders = Dir.glob "*"
         puts folders
         File.open('/home/marcos/folders.txt', 'w') do |f2|
            f2.puts folders
         end
         folders.each do |folder|
            Dir.chdir("/home/marcos/rcv1/" + folder)
            files = Dir.glob "*"
            files.each do |file|
               reuters_new_item = ReutersNewItem.new
               topics.clear
               puts i+=1
               puts folder
               puts file
               xml_page = Nokogiri::XML(open(file))               
               title = xml_page.xpath("//newsitem/headline").text
               text = xml_page.xpath("//newsitem/text").text
               date = xml_page.xpath("//newsitem")[0]['date']
               codes = xml_page.xpath("//newsitem/metadata/codes")
               codes.each do |code|
                  if code['class'] == "bip:topics:1.0"
                     categories = code.xpath("code")
                     categories.each do |category|
                        category = category['code']
                        topics = topics + ',' + category 
                     end
                  end
               end
               topics[0]=""
               reuters_new_item.name = title
               reuters_new_item.description = text
               reuters_new_item.topics = topics
               reuters_new_item.dateline = date
               reuters_new_item.file_id = file               
               reuters_new_item.persist
            end
         end
      rescue Exception => e
         puts "Exception create_rcv2_multilingual_corpus"
         puts e.message
         puts e.backtrace.inspect
      end
   end   
   
def funcion_rcv2
   i=0
   ReutersNewItem.where("topics like '%,%'").each do |item|
      puts i+=1
      if item.topics.include? "C15"
         item.topics = "C15"
      elsif item.topics.include? "E21"
         item.topics = "E21"
      elsif item.topics.include? "GCAT"
         item.topics = "GCAT"
      elsif item.topics.include? "CCAT"
         item.topics = "CCAT"
      elsif item.topics.include? "ECAT"
         item.topics = "ECAT"
      elsif item.topics.include? "M11"
         item.topics = "M11"
      end                 
      item.save                                     
   end
end

def funcion_rcv1
   i=0
   ReutersNewItem.where("topics like '%,%'").each do |item|
      puts i+=1
      if item.topics.include? "E21"
         item.topics = "E21"  
      elsif item.topics.include? "M11"
         item.topics = "M11"        
      elsif item.topics.include? "ECAT"
         item.topics = "ECAT"          
      elsif item.topics.include? "C15"
         item.topics = "C15"               
      elsif item.topics.include? "GCAT"
         item.topics = "GCAT"         
      elsif item.topics.include? "CCAT"
         item.topics = "CCAT"
      end                 
      item.save                                     
   end
end


###########################################################################
###########    SCRAPE_CNN_SPANISH     #####################################
###########################################################################

def scrape_cnn_spanish
   begin
      url_sections = [{:url => "http://cnnespanol.cnn.com/category/noticias/tecnologia/", :topic => "technology"},
         {:url => "http://cnnespanol.cnn.com/category/noticias/mundo/", :topic => "world"},
         {:url => "http://cnnespanol.cnn.com/category/noticias/salud/", :topic => "health"},
         {:url => "http://cnnespanol.cnn.com/category/noticias/deportes/", :topic => "sports"}] 
      
      url_sections.each do |section|
         scrape_section_cnn_spanish section[:url], section[:topic]
      end
   rescue Exception => e
      puts "Exception scrape_cnn_spanish"
      puts e.message
      puts e.backtrace.inspect
   end
end

def scrape_section_cnn_spanish(url, topic)
   begin
      i = 0
      nokogiri_html_page = Nokogiri::HTML(open(url, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0"))
      nokogiri_html_page.css("h2.cnnBlogContentTitle a").each do |item|
         url = item['href']
         scrape_item_cnn_spanish url, topic
      end     
      
      while i < 429
         if !nokogiri_html_page.css("span.cnn_post_navigation_prev a").empty?
            siguiente  = nokogiri_html_page.css("span.cnn_post_navigation_prev a")[0]['href']
            i+=1
            puts siguiente
            nokogiri_html_page = Nokogiri::HTML(open(siguiente, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0"))
            nokogiri_html_page.css("h2.cnnBlogContentTitle a").each do |item|
               url = item['href']
               scrape_item_cnn_spanish url, topic
            end            
         end
      end
   rescue Exception => e
      puts "Exception scrape_section_cnn_spanish"
      puts e.message
      puts e.backtrace.inspect
   end
end

def scrape_item_cnn_spanish(url, topic)
   begin
      puts url
      nokogiri_html_page = Nokogiri::HTML(open(url, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0"))
      title = nokogiri_html_page.css("h1.cnnBlogContentTitle a").text.strip
      puts title
      description = nokogiri_html_page.css("div.cnnBlogContentPost").text.strip
      puts description
      date = nokogiri_html_page.css("div.cnnBlogContentDateHead").text.strip
      puts date
      puts topic
      
      reuters_new_item = ReutersNewItem.new
      reuters_new_item.name = title
      reuters_new_item.description = description
      reuters_new_item.dateline = date
      reuters_new_item.topics = topic
      reuters_new_item.file_id = url
      #reuters_new_item.persist
   rescue Exception => e
      puts "Exception scrape_item_cnn_spanish"
      puts e.message
      puts e.backtrace.inspect
   end
end

############################################################
###########    SCRAPE_CNN_ENGLISH     ######################
############################################################


def scrape_cnn_english
   begin
      url_sections = [{:url => "http://us.cnn.com/tech", :topic => "technology"},
         {:url => "http://us.cnn.com/world", :topic => "world"},
         {:url => "http://us.cnn.com/health", :topic => "health"},
         {:url => "http://edition.cnn.com/sport", :topic => "sports"}] 
      
      url_sections.each do |section|
         scrape_section_cnn_spanish section[:url], section[:topic]
      end
   rescue Exception => e
      puts "Exception scrape_cnn_english"
      puts e.message
      puts e.backtrace.inspect
   end
end

def scrape_section_cnn_english(url, topic)
   begin
      i = 0
      nokogiri_html_page = Nokogiri::HTML(open(url, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0"))
      nokogiri_html_page.css("h2.cnnBlogContentTitle a").each do |item|
         url = item['href']
         scrape_item_cnn_spanish url, topic
      end     
      
      while i < 429
         if !nokogiri_html_page.css("span.cnn_post_navigation_prev a").empty?
            siguiente  = nokogiri_html_page.css("span.cnn_post_navigation_prev a")[0]['href']
            i+=1
            puts siguiente
            nokogiri_html_page = Nokogiri::HTML(open(siguiente, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0"))
            nokogiri_html_page.css("h2.cnnBlogContentTitle a").each do |item|
               url = item['href']
               scrape_item_cnn_spanish url, topic
            end            
         end
      end
   rescue Exception => e
      puts "Exception scrape_section_cnn_english"
      puts e.message
      puts e.backtrace.inspect
   end
end

def scrape_item_cnn_english(url, topic)
   begin
      puts url
      nokogiri_html_page = Nokogiri::HTML(open(url, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0"))
      title = nokogiri_html_page.css("h1.cnnBlogContentTitle a").text.strip
      puts title
      description = nokogiri_html_page.css("div.cnnBlogContentPost").text.strip
      puts description
      date = nokogiri_html_page.css("div.cnnBlogContentDateHead").text.strip
      puts date
      puts topic
      
      reuters_new_item = ReutersNewItem.new
      reuters_new_item.name = title
      reuters_new_item.description = description
      reuters_new_item.dateline = date
      reuters_new_item.topics = topic
      reuters_new_item.file_id = url
      #reuters_new_item.persist
   rescue Exception => e
      puts "Exception scrape_item_cnn_english"
      puts e.message
      puts e.backtrace.inspect
   end
end
   
require 'set'

def rand_n(n, max)
    randoms = Set.new
    loop do
        randoms << rand(max)
        return randoms.to_a if randoms.size >= n
    end
end   
   

def reuters_rcv1_amini_split
   begin
      topics = ['C15','CCAT','E21','ECAT','GCAT','M11']
      topics.each do |topic|
         i=0
         items = ReutersNewItem.where(:topics => topic)
         aleatorios = rand_n(5000,items.size)
         aleatorios.each do |aleatorio|
            puts i+=1
            puts topic
            items[aleatorio].has_topics = '1'
            items[aleatorio].save
         end
      end
              
   rescue Exception => e
      puts e.message
      puts e.backtrace.inspect
   end
end

def translate_corpus_spanish_to_english
   begin
      translator = Translator.new
      i=0
      ReutersNewItem.where(:info_to_wikify => nil).each do |item|
         translation = ""
         puts i+=1
         puts item.id
         puts
         # max size translation = 5000 characters
         if item.description.size <= 5000
            translation = translator.translate_google_through_url_sanitized(item.description)
         else
            splits = item.description.scan(/.{1,5000}/)
            for i in 0..splits.size-1
               split_translated = translator.translate_google_through_url_sanitized(splits[i])
               translation = translation + split_translated[0..-1]
            end
         end
         item.info_to_wikify = item.description
         item.description = translation         
         item.save
         puts "Item translated"
      end
   rescue Exception => e
      puts "Exception translate_rec2_english_to_spanish (corpus_creator)"
      puts e.message
      puts e.backtrace.inspect
   end
end

def re_translate_corpus_spanish_to_english
   begin
      translator = Translator.new
      i=0
      ReutersNewItem.where("description = '' or  description is null ").each do |item|
      #ReutersNewItem.where(:id => 54).each do |item|
         puts i+=1
         puts item.id
         puts
         translation = translator.translate_google_through_url_sanitized(item.info_to_wikify)
         item.description = translation         
         item.save
         puts "Item translated"
      end
   rescue Exception => e
      puts "Exception translate_rec2_english_to_spanish (corpus_creator)"
      puts e.message
      puts e.backtrace.inspect
   end
end
   
####################################################
#####             scrape_wikipedia            ######
####################################################

def scrape_wikipedia_category(category_url)
   begin
      total = 0
      nokogiri_html_page = Nokogiri::HTML(open(category_url))
      
      #categories = ['Culture and the arts', 'Geography and places', 'Mathematics and logic']
      
      categories = ['Mathematics and logic']
      
      nokogiri_html_page.css("div#content.mw-body div#bodyContent.mw-body-content div#mw-content-text.mw-content-ltr div").each do |div|
         if div['style'] == "display: block;border: 0px solid #A3BFB1;border-bottom: 0px solid #A3BFB1;vertical-align: top;background: #F5FFFA;color: black;margin-bottom: 10px;padding: 1em;margin-top: 0em;padding-top: .3em;"
            category_title = div.previous_element.css("h2 span big")[0].text.strip.gsub("   (see in all page types)","").strip
            if categories.include? category_title
               puts category_title
               puts
               div.css("a").each do |subcategory|
                  if subcategory['href'].include? "Category:"
                     puts subcategory['href']
                     puts
                     scrape_wikipedia_subcategory "http://en.wikipedia.org" + subcategory['href'], category_title
                  end
               end
            end
         end
      end
      
   rescue Exception => e
      puts "Exception scrape_wikipedia_category"
      puts e.message
      puts e.backtrace.inspect
   end
end


def scrape_wikipedia_subcategory(subcategory_url, category)
   begin
      letras = ("A".."Z").to_a
      nokogiri_html_page = Nokogiri::HTML(open(subcategory_url))
      nokogiri_html_page.css("div#mw-pages div.mw-content-ltr div.mw-category div.mw-category-group").each do |category_group|
         if letras.include? category_group.css("h3").text.strip
            category_group.css("ul li a").each do |article|
               article_url = article['href']
               if !article_url.include? "Portal:"
                  puts article_url
                  scrape_wikipedia_article "http://en.wikipedia.org" + article_url, category
               end
            end
         end
      end
   rescue Exception => e
      puts "Exception scrape_wikipedia_subcategory"
      puts e.message
      puts e.backtrace.inspect
   end
end



def scrape_wikipedia_article(article_url, category)
   begin
      
      scraped_article = ReutersNewItem.new
      
      article_body = ""
      
      nokogiri_html_page = Nokogiri::HTML(open(article_url))
      article_title = nokogiri_html_page.css("h1#firstHeading.firstHeading").text.strip
            
      nokogiri_html_page.css("div#content.mw-body div#bodyContent.mw-body-content div#mw-content-text.mw-content-ltr p").each do |p|
         article_body = article_body + p.text.strip
      end
      
      puts article_title
      
      puts article_body
      
      puts category
      
      if !nokogiri_html_page.css("div.body ul li.interlanguage-link.interwiki-es").empty?
         spanish_url = nokogiri_html_page.css("div.body ul li.interlanguage-link.interwiki-es a")[0]['href']
      end
      
      puts spanish_url
      
      File.open('spanish_wikipedia_links.txt', 'a') do |f2|
         f2.puts spanish_url
      end
      
      reuters_new_item = ReutersNewItem.new
      reuters_new_item.name = article_title
      reuters_new_item.description = article_body
      reuters_new_item.topics = category      
      reuters_new_item.file_id = article_url
      reuters_new_item.persist      
      
   rescue Exception => e
      puts "Exception scrape_wikipedia_article"
      puts e.message
      puts e.backtrace.inspect
   end
end

def scrape_wikipedia_article_spanish
   begin
      
      scraped_article = ReutersNewItem.new
      
      article_body = ""
      
      cont = 0
      
      File.open('spanish_wikipedia_links.txt', 'r') do |f1|
        while linea = f1.gets
          article_body = ""
          if linea.size > 1 and !linea.include? "##"
               nokogiri_html_page = Nokogiri::HTML(open(linea.gsub("//","http://")))
               article_title = nokogiri_html_page.css("h1#firstHeading.firstHeading").text.strip
                     
               nokogiri_html_page.css("div#content.mw-body div#bodyContent.mw-body-content div#mw-content-text.mw-content-ltr p").each do |p|
                  article_body = article_body + p.text.strip
               end
               
               puts article_title
               puts
               puts article_body
               puts
               puts linea
               
               #puts category
               
               article_url = linea
               
               reuters_new_item = ReutersNewItem.new
               reuters_new_item.name = article_title
               reuters_new_item.description = article_body
               #reuters_new_item.topics = category      
               reuters_new_item.file_id = article_url
               reuters_new_item.persist  
          end
        end
      end
   rescue Exception => e
      puts "Exception scrape_wikipedia_article"
      puts e.message
      puts e.backtrace.inspect
   end
end


def scrape_cnx
   begin
      categories = Array.new
      
      Capybara.register_driver :webkit do |app|
           Capybara::Selenium::Driver.new(app)
         end
         Capybara.javascript_driver = :webkit
         session = Capybara::Session.new(:webkit)
         
      url = "http://cnx.org/contents"
      
      session.visit(url)
        
      sleep 3
                                    
      nokogiri_html_page = Nokogiri::HTML(session.body)        
      
      File.open('text.html', 'w') do |f2|
         f2.puts nokogiri_html_page
      end
      
      nokogiri_html_page.css("div.browse-content ul li").each do |category|
        url = "http://cnx.org" + category.css("h3 a")[0]['href']
        category = category.css("h3 a")[0].text.strip
        categories << {:url => url, :category_name => category}
      end
      
      session.driver.browser.quit
      
      categories.each do |category|
         scrape_categories_cnx category[:category_name]
      end
      
   rescue Exception => e
      puts "Exception scrape_cnx"
      puts e.message
      puts e.backtrace.inspect
   end
end

def scrape_categories_cnx(category_name)
   begin
      page_limits = [{:category_name => "Arts", :limit => 75},
         {:category_name => "Business", :limit => 40},
         {:category_name => "Humanities", :limit => 131},
         {:category_name => "Mathematics and Statistics", :limit => 298},
         {:category_name => "Science and Technology", :limit => 595},
         {:category_name => "Social Sciences", :limit => 177}]
         
      page_limit = page_limits.find{|k| k[:category_name] == category_name}
      
      page_limit = page_limit[:limit]
           
      for page in 91..page_limit
         url = URI.encode('http://archive.cnx.org/search?q=subject:"' + category_name + '"&page=' + page.to_s)
         puts url
         json = Nokogiri::HTML(open(url))
         parsed_json = JSON.parse json
         parsed_json['results']['items'].each do |item|
            id = item["id"]
            scrape_oer_cnx id, category_name
         end     
      end               
   rescue Exception => e
      puts "Exception scrape_category_cnx"
      puts e.message
      puts e.backtrace.inspect
   end
end

def scrape_oer_cnx(id, category_name)
   begin
      url = "http://archive.cnx.org/contents/" + id.to_s + ".json"
      puts url
      json = Nokogiri::HTML(open(url))
      parsed_json = JSON.parse json
      language =  parsed_json['language']
      if language == "en"
         array_keywords = Array.new
         title = parsed_json['title']
         puts title
         description = parsed_json['abstract']
         puts description
         keywords = parsed_json['keywords']
         keywords.each do |keyword|
            array_keywords << keyword.strip
         end
         reuters_new_item = ReutersNewItem.new
         reuters_new_item.name = title
         reuters_new_item.description = description
         reuters_new_item.topics = category_name     
         reuters_new_item.file_id = url
         reuters_new_item.persist(array_keywords)               
      end
   rescue Exception => e
      puts "Exception scrape_oer_cnx"
      puts e.message
      puts e.backtrace.inspect
   end
end

def scrape_wikipedia_human_medicine_category
   begin
      human_medicine_subcategories = [
       "Alternative_medicine",
       "Cardiology",
       "Endocrinology",
       "Forensics",
       "Gastroenterology",
       "Genetics",
       "Geriatrics",
       "Gerontology",
       "Gynaecology",
       "Hematology",
       "Nephrology",
       "Neurology",
       "Obstetrics",
       "Oncology",
       "Ophthalmology",
       "Orthopedic_surgical_procedures",
       "Pathology",
       "Pediatrics",
       "Psychiatry",
       "Rheumatology",
       "Surgery",
       "Urology"]
       
       human_medicine_subcategories = ["Gynaecology"]
        
       human_medicine_subcategories.each do |human_medicine_subcategory|
          human_medicine_subcategory_url = "http://en.wikipedia.org/wiki/Category:" + human_medicine_subcategory
          puts human_medicine_subcategory_url
          scrape_wikipedia_human_medicine_subcategory human_medicine_subcategory_url, human_medicine_subcategory
       end
    
   rescue Exception => e
      puts "Exception scrape_wikipedia_human_medicine_category"
      puts e.message
      puts e.backtrace.inspect
   end
end

def scrape_wikipedia_human_medicine_subcategory(subcategory_url, category)
   begin
      letras = ("A".."Z").to_a
      nokogiri_html_page = Nokogiri::HTML(open(subcategory_url))
      nokogiri_html_page.css("div#mw-pages div.mw-content-ltr div.mw-category div.mw-category-group").each do |category_group|
         if letras.include? category_group.css("h3").text.strip
            category_group.css("ul li a").each do |article|
               article_url = article['href']
               if !article_url.include? "Portal:"
                  article_url = "http://dbpedia.org/page/" + article_url.gsub("/wiki/","")
                  article_url = article_url.gsub("page","data") + ".rdf"
                  puts article_url
                  scrape_dbpedia_article article_url, category
               end
            end
         end
      end
   rescue Exception => e
      puts "Exception scrape_wikipedia_human_medicine_subcategory"
      puts e.message
      puts e.backtrace.inspect
   end
end

def scrape_dbpedia_article(article_url, category)
   begin  
      
      scraped_article = ReutersNewItem.new
      spanish_url = ""
      article_title = ""
      article_abstract = ""
      
      nokogiri_html_page = Nokogiri::XML(open(article_url))
      
      nokogiri_html_page.xpath("//rdf:RDF/rdf:Description/rdfs:label").each do |label|
         if label['xml:lang'] == "en"
            article_title = label.text
         end
      end
      
      puts article_title
      
      nokogiri_html_page.xpath("//rdf:RDF/rdf:Description/dbpedia-owl:abstract").each do |abstract|
         if abstract['xml:lang'] == "en"
            article_abstract = abstract.text
         end
      end     

      puts article_abstract
     
      puts category
      
      nokogiri_html_page.xpath("//rdf:RDF/rdf:Description/owl:sameAs").each do |lang|
         if lang['rdf:resource'].include? "http://es.dbpedia.org"
            spanish_url = lang['rdf:resource']
         end
      end     

      puts spanish_url 
           
      reuters_new_item = ReutersNewItem.new
      reuters_new_item.name = article_title
      reuters_new_item.description = article_abstract
      reuters_new_item.topics = category      
      reuters_new_item.file_id = article_url
      reuters_new_item.companies = spanish_url
      reuters_new_item.persist      
      
   rescue Exception => e
      puts "Exception scrape_dbpedia_article"
      puts e.message
      puts e.backtrace.inspect
   end
end


def scrape_spanish_dbpedia_articles
   begin  
      
      File.open('spanish_dbpedia_article_links.txt', 'r') do |f1|
         while linea = f1.gets
            puts linea
            article_url = linea.split("|")[0].strip
            category = linea.split("|")[1].strip
            
            article_url = URI.encode(article_url)
            
            scraped_article = ReutersNewItem.new
            article_title = ""
            article_abstract = ""
            
            begin          
               nokogiri_html_page = Nokogiri::HTML(open(article_url))             
               article_title = nokogiri_html_page.css("div#header div#hd_l h1#title a")[0].text              
               puts article_title       
               article_abstract = nokogiri_html_page.css("div#content .description .odd ul li span.literal span")[0].text     
               puts article_abstract    
               puts category                 
            rescue
            end
                 
            reuters_new_item = ReutersNewItem.new
            reuters_new_item.name = article_title
            reuters_new_item.description = article_abstract
            reuters_new_item.topics = category      
            reuters_new_item.file_id = article_url
            reuters_new_item.persist 
         end   
      end  
      
   rescue Exception => e
      puts "Exception scrape_dbpedia_article"
      puts e.message
      puts e.backtrace.inspect
   end
end

def spanish_dbpedia_articles_list
   begin
      ReutersNewItem.where("companies not like ''").each do |item|
         File.open('spanish_dbpedia_article_links.txt', 'a') do |f2|
            f2.puts item.companies + " | " + item.topics
         end
      end
   rescue Exception => e
      puts e.message
      puts e.backtrace.inspect
   end
end

def count_elements_per_category
   
   array = Array.new
   
       human_medicine_subcategories = [
       "Alternative_medicine",
       "Cardiology",
       "Endocrinology",
       "Forensics",
       "Gastroenterology",
       "Genetics",
       "Geriatrics",
       "Gerontology",
       "Gynaecology",
       "Hematology",
       "Nephrology",
       "Neurology",
       "Obstetrics",
       "Oncology",
       "Ophthalmology",
       "Orthopedic_surgical_procedures",
       "Pathology",
       "Pediatrics",
       "Psychiatry",
       "Rheumatology",
       "Surgery",
       "Urology"]
            
       human_medicine_subcategories.each do |cat|
          #size = ReutersNewItem.where(:topics => cat).where("companies not like ''").size
          size = ReutersNewItem.where(:topics => cat).size
          array << cat + ": " + size.to_s
       end
       puts array
end


def obtain_image_url_merlot
   ReutersNewItem.where(:exchanges => nil).each do |item|
      begin
         nokogiri_html_page = Nokogiri::HTML(item.companies)
         image_url = nokogiri_html_page.css("div.material_tile_body div.md_materialphoto_div img.md_materialImg")[0]['src']
         if !image_url.include? "http"
            image_url = "http://www.merlot.org" + image_url
         end         
         puts image_url
         file_id = "http://www.merlot.org/merlot/viewMaterial.htm?id=" + item.file_id.to_s
         puts file_id
         item.file_id = file_id
         item.exchanges = image_url
         item.save
      rescue
         puts "Exception obtain_image_url_merlot"
      end
   end
end

def obtain_image_url_cnx
   ReutersNewItem.all.each do |item|
      begin
         if item.info_to_wikify == nil
            url = item.file_id.gsub("json","html")
         else
            url = item.info_to_wikify.gsub("json","html")
         end         
         
         puts url
         nokogiri_html_page = Nokogiri::HTML(open(url))
         if !nokogiri_html_page.css("img").empty?
            image_url = nokogiri_html_page.css("img")[0]['src']
               if !image_url.include? "http"
                  image_url = "http://archive.cnx.org" + image_url
            end
         end
         if item.info_to_wikify == nil
            file_id = item.file_id.gsub(".json","").gsub("archive.","")
         else
            file_id = item.info_to_wikify.gsub(".json","").gsub("archive.","")
         end
         item.exchanges = image_url
         if item.info_to_wikify == nil
            item.info_to_wikify = item.file_id
         end
         item.file_id = file_id
         puts item.name
         puts "image"
         puts item.exchanges
         puts "url"
         puts item.file_id
         item.save 
      rescue Exception => e
         puts "Exception obtain_image_url_cnx"
         puts e.message
         puts e.backtrace.inspect
      end
   end
end


def obtain_image_url_oercommons
   ReutersNewItem.where(:exchanges => nil).each do |item|
      begin
         nokogiri_html_page = Nokogiri::HTML(item.companies)
         image_url = nokogiri_html_page.css(".item.view-item section.details div.thumb a img")[0]['src']
         puts image_url
         item.exchanges = image_url
         item.save
      rescue
      end
   end
end


def oer_aggregator_evaluations
   begin
      good = 0
      not_bad = 0
      bad = 0
      dont_know = 0 
      number_of_evaluations = Evaluations.all.size
      Evaluations.all.each do |evaluation|
         if evaluation == "good"
            good += 1            
         elsif evaluation == "not_bad"
            not_bad += 1
         elsif evaluation == "not_bad"
            not_bad += 1
         elsif evaluation == "bad"
            bad += 1              
         elsif evaluation == "dont_know"
            dont_know += 1      
         end                
      end
      good_percentage = good / number_of_evaluations
      not_bad_percentage = not_bad / number_of_evaluations
      bad_percentage = bad / number_of_evaluations
      dont_know_percentage = dont_know / number_of_evaluations
           
      Documents.all.each do |document|
         if document.evaluations.size != 0
            good = 0
            not_bad = 0
            bad = 0
            dont_know = 0             
            document.evaluation.each do |evaluation|
               if evaluation == "good"
                  good += 1            
               elsif evaluation == "not_bad"
                  not_bad += 1
               elsif evaluation == "not_bad"
                  not_bad += 1
               elsif evaluation == "bad"
                  bad += 1              
               elsif evaluation == "dont_know"
                  dont_know += 1      
               end                   
            end
         end
      end

   rescue Exception => e
      puts "Exception evaluations"
      puts e.message
      puts e.backtrace.inspect
   end
end

   def test_oer_aggregator()
      begin
         Capybara.register_driver :selenium do |app|
           Capybara::Selenium::Driver.new(app)
         end
         Capybara.javascript_driver = :selenium
         
         t1=Thread.new{test_oer_aggregator_session}
    
         t2=Thread.new{test_oer_aggregator_session}
         t3=Thread.new{test_oer_aggregator_session}
        
         t4=Thread.new{test_oer_aggregator_session}
         t5=Thread.new{test_oer_aggregator_session}
         t6=Thread.new{test_oer_aggregator_session}
         t7=Thread.new{test_oer_aggregator_session}
         t8=Thread.new{test_oer_aggregator_session}
         t9=Thread.new{test_oer_aggregator_session}
         t10=Thread.new{test_oer_aggregator_session}
              
         t11=Thread.new{test_oer_aggregator_session}
         t12=Thread.new{test_oer_aggregator_session}
         t13=Thread.new{test_oer_aggregator_session}
         t14=Thread.new{test_oer_aggregator_session}
         t15=Thread.new{test_oer_aggregator_session}
         t16=Thread.new{test_oer_aggregator_session}
         t17=Thread.new{test_oer_aggregator_session}
         t18=Thread.new{test_oer_aggregator_session}
         t19=Thread.new{test_oer_aggregator_session}
         t20=Thread.new{test_oer_aggregator_session}
=begin 
=end        
  
         t1.join

         t2.join
         t3.join
             
         t4.join
         t5.join
         t6.join
         t7.join
         t8.join
         t9.join
         t10.join
        
         t11.join
         t12.join
         t13.join
         t14.join
         t15.join
         t16.join
         t17.join
         t18.join
         t19.join
         t20.join
=begin   
=end         
                  

            
         
                                    
      rescue Exception  => e
         puts "Exception test_oer_aggregator"
         puts e.message
         puts e.backtrace.inspect
      end
   end

   def test_oer_aggregator_session()
      begin
         Capybara.register_driver :selenium do |app|
           Capybara::Selenium::Driver.new(app)
         end
         Capybara.javascript_driver = :selenium       
            session = Capybara::Session.new(:selenium)        
            url= "http://localhost:3000"   
            sleep(rand(0.0...5.0))         
            session.visit(url)
            sleep(rand(0.0...5.0))
            session.fill_in('user_name', with: Time.now.to_s)
            sleep(rand(0.0...5.0))
            session.fill_in('user_surname', with: 'Mourino')
            sleep(rand(0.0...5.0))
            session.choose('teacher')
            sleep(rand(0.0...5.0))
            session.click_button('Send')
            session_url = session.current_url
            user_id = session_url.split("user_id=")[1]
            go_to_url = "http://localhost:3000/documents/16250?repository=oercommons&section=law&page=0&user_id=" + user_id.to_s
            sleep(rand(0.0...5.0))
            session.visit(go_to_url)
            sleep(rand(0.0...5.0))
            session.choose('evaluation0')
            sleep(rand(0.0...5.0))
            session.choose('evaluation1')
            sleep(rand(0.0...5.0))
            session.choose('evaluation2')
            sleep(rand(0.0...5.0))
            session.choose('evaluation3')
            sleep(rand(0.0...5.0))
            session.choose('evaluation4')
            sleep(rand(0.0...5.0))
            session.choose('evaluation5')
            sleep(rand(0.0...5.0))
            session.choose('evaluation6')
            sleep(rand(0.0...5.0))
            session.choose('evaluation7')
            sleep(rand(0.0...5.0))
            session.click_button("Send Evaluation")
            session.driver.browser.quit                         
      rescue Exception  => e
         puts "Exception test_oer_aggregator_session"
         puts e.message
         puts e.backtrace.inspect
      end
   end
   
def human_evaluation(best_participants)
   begin
      documents_evaluated_per_participant = Array.new
      total_documents_evaluated = Array.new
      ids = Array.new
      participants = Array.new
      all_participants = Participant.all
      all_participants.each do |participant|
         if best_participants.include? participant.id
         #if participant.evaluations.size != 0
            participants << participant
         end
      end      
      #participants = Participant.where('id > 1')
      participants.each do |participant|
         documents_evaluated_per_participant = Array.new
         puts "Name: " + participant.name + " " + participant.surname
         evaluations = Evaluation.where(:participant_id => participant.id)
         evaluations.each do |evaluation|
            documents_evaluated_per_participant << evaluation.document_id
         end
         documents_evaluated_per_participant = documents_evaluated_per_participant.uniq
         if documents_evaluated_per_participant != nil
            puts "Resources evaluated: " + documents_evaluated_per_participant.size.to_s
            total_documents_evaluated = total_documents_evaluated + documents_evaluated_per_participant
         end                   
      end


      Evaluation.all.each do |evaluation|
         ids << evaluation.document_id
      end
      unique_ids = ids.uniq
      puts "__________________________________________________"
      puts
      puts "Total participants: " + all_participants.size.to_s
      puts "Participants who evaluated resources: " + participants.size.to_s      
      puts "Number of resources evaluated: " + total_documents_evaluated.size.to_s + ". Unique: " + unique_ids.size.to_s
      puts "__________________________________________________" 
      

   rescue Exception => e
      puts "Exception human_evaluation"
      puts e.message
      puts e.backtrace.inspect
   end
end

#croera_vs_human_judgement

def human_evaluation_metrics(best_participants)
   begin
      total_precision_oercommons = 0.0
      total_precision_merlot = 0.0
      total_precision_cnx = 0.0
      total_recall_oercommons = 0.0
      total_recall_merlot = 0.0
      total_recall_cnx = 0.0
      total_f1_oercommons = 0.0
      total_f1_merlot = 0.0
      total_f1_cnx = 0.0
      final_precision_oercommons = 0.0
      final_precision_merlot = 0.0
      final_precision_cnx = 0.0
      final_recall_oercommons = 0.0
      final_recall_merlot = 0.0
      final_recall_cnx = 0.0
      final_f1_oercommons = 0.0
      final_f1_merlot = 0.0
      final_f1_cnx = 0.0      
      evaluation_categories_oercommons = Array.new
      evaluation_categories_merlot = Array.new
      evaluation_categories_cnx = Array.new     
      evaluation_categories = Array.new
      documents_evaluated_per_participant = Array.new
      participants = Array.new
      total_documents_evaluated = Array.new
      all_participants = Participant.all
      all_participants.each do |participant|
         #if participant.evaluations.size != 0
         if best_participants.include? participant.id
            participants << participant
         end
      end
      participants.each do |participant|
         documents_evaluated_per_participant.clear
         evaluations = Evaluation.where(:participant_id => participant.id)
         evaluations.each do |evaluation|
            documents_evaluated_per_participant << evaluation.document_id
         end
         documents_evaluated_per_participant = documents_evaluated_per_participant.uniq
         #puts documents_evaluated_per_participant  
         #puts
         documents_evaluated_per_participant.each do |document_id|
            puts
            puts "--------------------------------------------------------"
            puts "Document: " + document_id.to_s
            evaluation_categories_oercommons.clear
            evaluation_categories_merlot.clear
            evaluation_categories_cnx.clear            
            Evaluation.where(:participant_id => participant.id, :document_id => document_id, :corpus_taxonomy => "oercommons").each do |evaluation|
               evaluation_categories_oercommons <<  evaluation.category
            end
            Evaluation.where(:participant_id => participant.id, :document_id => document_id, :corpus_taxonomy => "merlot").each do |evaluation|
               evaluation_categories_merlot <<  evaluation.category
            end
            Evaluation.where(:participant_id => participant.id, :document_id => document_id, :corpus_taxonomy => "cnx").each do |evaluation|
               evaluation_categories_cnx <<  evaluation.category
            end          
              
            document_categories_oercommons = Document.where(:id => document_id).first.classified_in_category_oercommons.split(",")
            document_categories_merlot = Document.where(:id => document_id).first.classified_in_category_merlot.split(",")
            document_categories_cnx = Document.where(:id => document_id).first.classified_in_category_cnx.split(",")
            
            ["oercommons", "merlot", "cnx"].each do |repository|          
               #puts "||||" +  repository  +  "||||"  
               #puts
               if repository == "oercommons"
                  evaluation_categories = evaluation_categories_oercommons
                  document_categories = document_categories_oercommons 
               elsif repository == "merlot"
                  evaluation_categories = evaluation_categories_merlot
                  document_categories = document_categories_merlot
               elsif repository == "cnx"
                  evaluation_categories = evaluation_categories_cnx
                  document_categories = document_categories_cnx
               end
                  
               #puts "EVALUATION CATEGORIES"
               #puts evaluation_categories
               #puts
               #puts "DOCUMENT CATEGORIES"
               #puts document_categories
               #puts
               tp = (evaluation_categories & document_categories).size
               fp = (document_categories - evaluation_categories).size
               fn = (evaluation_categories - document_categories).size
               #puts "TP"
               #puts tp
               #puts "FP"
               #puts fp
               #puts "FN"
               #puts fn
               if (tp + fp) == 0
                  precision = 0
               else 
                  precision = tp / (tp + fp)
               end
                                     
               if (tp + fn) == 0
                  recall = 0
               else
                  recall = tp / (tp + fn)
               end
                                          
               if precision == 0 and recall == 0
                  f1 = 0
               else
                  f1 = (2*precision*recall) / (precision + recall)
               end
               
               puts "Repository: " + repository
               puts "Precision: " + precision.to_s
               puts "Recall: " + recall.to_s
               puts "F1-score: " + f1.to_s
               puts
               
               if repository == "oercommons"
                  total_precision_oercommons = total_precision_oercommons + precision
                  total_recall_oercommons = total_recall_oercommons + recall
                  total_f1_oercommons = total_f1_oercommons + f1                       
               elsif repository == "merlot"
                  total_precision_merlot = total_precision_merlot + precision
                  total_recall_merlot = total_recall_merlot + recall
                  total_f1_merlot = total_f1_merlot + f1        
               elsif repository == "cnx"
                  total_precision_cnx = total_precision_cnx + precision
                  total_recall_cnx = total_recall_cnx + recall
                  total_f1_cnx = total_f1_cnx + f1        
               end
                             
            end           

          
         end
         puts " ________________________"
         puts "|                        |"                
         puts "| TOTAL_METRICS_PER_USER |"
         puts "|________________________|"
         puts
         puts "OERCOMMONS"
         puts total_precision_oercommons = total_precision_oercommons / documents_evaluated_per_participant.size
         puts total_recall_oercommons = total_recall_oercommons / documents_evaluated_per_participant.size
         puts total_f1_oercommons = total_f1_oercommons / documents_evaluated_per_participant.size
         puts          
         puts "MERLOT"            
         puts total_precision_merlot = total_precision_merlot / documents_evaluated_per_participant.size
         puts total_recall_merlot = total_recall_merlot / documents_evaluated_per_participant.size
         puts total_f1_merlot = total_f1_merlot / documents_evaluated_per_participant.size
         puts                  
         puts "CNX"  
         puts total_precision_cnx = total_precision_cnx / documents_evaluated_per_participant.size
         puts total_recall_cnx = total_recall_cnx / documents_evaluated_per_participant.size
         puts total_f1_cnx = total_f1_cnx / documents_evaluated_per_participant.size
         final_precision_oercommons = final_precision_oercommons + total_precision_oercommons
         final_recall_oercommons = final_recall_oercommons + total_recall_oercommons
         final_f1_oercommons = final_f1_oercommons + total_f1_oercommons
         final_precision_merlot = final_precision_merlot + total_precision_merlot
         final_recall_merlot = final_recall_merlot + total_recall_merlot
         final_f1_merlot = final_f1_merlot + total_f1_merlot
         final_precision_cnx = final_precision_cnx + total_precision_cnx
         final_recall_cnx = final_recall_cnx + total_recall_cnx
         final_f1_cnx = final_f1_cnx + total_f1_cnx
         total_precision_oercommons = 0.0
         total_precision_merlot = 0.0
         total_precision_cnx = 0.0
         total_recall_oercommons = 0.0
         total_recall_merlot = 0.0
         total_recall_cnx = 0.0
         total_f1_oercommons = 0.0
         total_f1_merlot = 0.0
         total_f1_cnx = 0.0
      end
      puts " _______________"
      puts "|               |"                
      puts "| TOTAL_METRICS |"
      puts "|_______________|"
      puts
      puts "OERCOMMONS"
      puts "----------"
      puts "P = " + (final_precision_oercommons / participants.size).to_s
      puts "R = " + (final_recall_oercommons / participants.size).to_s
      puts "F1 = " + (final_f1_oercommons / participants.size).to_s
      puts          
      puts "MERLOT"
      puts "-------"            
      puts "P = " + (final_precision_merlot / participants.size).to_s
      puts "R = " + (final_recall_merlot / participants.size).to_s
      puts "F1 = " + (final_f1_merlot / participants.size).to_s
      puts                  
      puts "CNX"  
      puts "----"
      puts "P = " + (final_precision_cnx / participants.size).to_s
      puts "R = " + (final_recall_cnx / participants.size).to_s
      puts "F1 = " + (final_f1_cnx / participants.size).to_s
      final_precision_oercommons = 0.0
      final_precision_merlot = 0.0
      final_precision_cnx = 0.0
      final_recall_oercommons = 0.0
      final_recall_merlot = 0.0
      final_recall_cnx = 0.0
      final_f1_oercommons = 0.0
      final_f1_merlot = 0.0
      final_f1_cnx = 0.0     
   rescue Exception => e
      puts "Exception human_evaluation_metrics"
      puts e.message
      puts e.backtrace.inspect
   end
end


def human_evaluation_metrics_vs_repository
   begin
      total_precision_oercommons = 0.0
      total_precision_merlot = 0.0
      total_precision_cnx = 0.0
      total_recall_oercommons = 0.0
      total_recall_merlot = 0.0
      total_recall_cnx = 0.0
      total_f1_oercommons = 0.0
      total_f1_merlot = 0.0
      total_f1_cnx = 0.0
      final_precision_oercommons = 0.0
      final_precision_merlot = 0.0
      final_precision_cnx = 0.0
      final_recall_oercommons = 0.0
      final_recall_merlot = 0.0
      final_recall_cnx = 0.0
      final_f1_oercommons = 0.0
      final_f1_merlot = 0.0
      final_f1_cnx = 0.0
      number_of_documents_oercommons = 0      
      number_of_documents_merlot = 0
      number_of_documents_cnx = 0
      evaluation_categories_oercommons = Array.new
      evaluation_categories_merlot = Array.new
      evaluation_categories_cnx = Array.new     
      evaluation_categories = Array.new
      documents_evaluated_per_participant = Array.new
      participants = Array.new
      total_documents_evaluated = Array.new
      all_participants = Participant.all
      all_participants.each do |participant|
         if participant.evaluations.size != 0
            participants << participant
         end
      end
      #participants = Participant.where(:id => 100)
      participants.each do |participant|
         documents_evaluated_per_participant.clear
         evaluations = Evaluation.where(:participant_id => participant.id)
         evaluations.each do |evaluation|
            documents_evaluated_per_participant << evaluation.document_id
         end
         documents_evaluated_per_participant = documents_evaluated_per_participant.uniq
         #puts documents_evaluated_per_participant  
         #puts
         documents_evaluated_per_participant.each do |document_id|
            puts
            puts "--------------------------------------------------------"
            puts "Document: " + document_id.to_s
            evaluation_categories_oercommons.clear
            evaluation_categories_merlot.clear
            evaluation_categories_cnx.clear            
            
            document_categories = Document.where(:id => document_id).first.original_category.split(",")
            repository  = Document.where(:id => document_id).first.corpus
            
            if repository == "oercommons"
               Evaluation.where(:participant_id => participant.id, :document_id => document_id, :corpus_taxonomy => "oercommons").each do |evaluation|
                  evaluation_categories_oercommons <<  evaluation.category
                  number_of_documents_oercommons += 1 
               end
            elsif repository == "merlot"
               Evaluation.where(:participant_id => participant.id, :document_id => document_id, :corpus_taxonomy => "merlot").each do |evaluation|
                  evaluation_categories_merlot <<  evaluation.category
                  number_of_documents_merlot += 1
               end
            elsif repository == "cnx"
               Evaluation.where(:participant_id => participant.id, :document_id => document_id, :corpus_taxonomy => "cnx").each do |evaluation|
                  evaluation_categories_cnx <<  evaluation.category
                  number_of_documents_cnx += 1
               end               
            end
            
       
            #puts "||||" +  repository  +  "||||"  
            #puts
            if repository == "oercommons"
               evaluation_categories = evaluation_categories_oercommons
               document_categories = document_categories 
            elsif repository == "merlot"
               evaluation_categories = evaluation_categories_merlot
               document_categories = document_categories
            elsif repository == "cnx"
               evaluation_categories = evaluation_categories_cnx
               document_categories = document_categories
            end
               
            puts "EVALUATION CATEGORIES"
            puts evaluation_categories
            puts
            puts "DOCUMENT CATEGORIES"
            puts document_categories
            puts
            tp = (evaluation_categories & document_categories).size
            fp = (document_categories - evaluation_categories).size
            fn = (evaluation_categories - document_categories).size
            #puts "TP"
            #puts tp
            #puts "FP"
            #puts fp
            #puts "FN"
            #puts fn
            if (tp + fp) == 0
               precision = 0
            else 
               precision = tp / (tp + fp)
            end
                                  
            if (tp + fn) == 0
               recall = 0
            else
               recall = tp / (tp + fn)
            end
                                       
            if precision == 0 and recall == 0
               f1 = 0
            else
               f1 = (2*precision*recall) / (precision + recall)
            end
            
            puts "Repository: " + repository
            puts "Precision: " + precision.to_s
            puts "Recall: " + recall.to_s
            puts "F1-score: " + f1.to_s
            puts
            
            if repository == "oercommons"
               total_precision_oercommons = total_precision_oercommons + precision
               total_recall_oercommons = total_recall_oercommons + recall
               total_f1_oercommons = total_f1_oercommons + f1                       
            elsif repository == "merlot"
               total_precision_merlot = total_precision_merlot + precision
               total_recall_merlot = total_recall_merlot + recall
               total_f1_merlot = total_f1_merlot + f1        
            elsif repository == "cnx"
               total_precision_cnx = total_precision_cnx + precision
               total_recall_cnx = total_recall_cnx + recall
               total_f1_cnx = total_f1_cnx + f1        
            end
                                           
         end
         puts " ________________________"
         puts "|                        |"                
         puts "| TOTAL_METRICS_PER_USER |"
         puts "|________________________|"
         puts
         puts "OERCOMMONS"
         if number_of_documents_oercommons != 0
            puts total_precision_oercommons = total_precision_oercommons / number_of_documents_oercommons
            puts total_recall_oercommons = total_recall_oercommons / number_of_documents_oercommons
            puts total_f1_oercommons = total_f1_oercommons / number_of_documents_oercommons
         end
         puts          
         puts "MERLOT"
         if number_of_documents_merlot != 0            
            puts total_precision_merlot = total_precision_merlot / number_of_documents_merlot
            puts total_recall_merlot = total_recall_merlot / number_of_documents_merlot
            puts total_f1_merlot = total_f1_merlot / number_of_documents_merlot
         puts                  
         end
         puts "CNX"
         if number_of_documents_cnx != 0  
            puts total_precision_cnx = total_precision_cnx / number_of_documents_cnx
            puts total_recall_cnx = total_recall_cnx / number_of_documents_cnx
            puts total_f1_cnx = total_f1_cnx / number_of_documents_cnx
         end
         
         final_precision_oercommons = final_precision_oercommons + total_precision_oercommons
         final_recall_oercommons = final_recall_oercommons + total_recall_oercommons
         final_f1_oercommons = final_f1_oercommons + total_f1_oercommons
         final_precision_merlot = final_precision_merlot + total_precision_merlot
         final_recall_merlot = final_recall_merlot + total_recall_merlot
         final_f1_merlot = final_f1_merlot + total_f1_merlot
         final_precision_cnx = final_precision_cnx + total_precision_cnx
         final_recall_cnx = final_recall_cnx + total_recall_cnx
         final_f1_cnx = final_f1_cnx + total_f1_cnx
         total_precision_oercommons = 0.0
         total_precision_merlot = 0.0
         total_precision_cnx = 0.0
         total_recall_oercommons = 0.0
         total_recall_merlot = 0.0
         total_recall_cnx = 0.0
         total_f1_oercommons = 0.0
         total_f1_merlot = 0.0
         total_f1_cnx = 0.0
         number_of_documents_oercommons = 0      
         number_of_documents_merlot = 0
         number_of_documents_cnx = 0         
      end
      puts " _______________"
      puts "|               |"                
      puts "| TOTAL_METRICS |"
      puts "|_______________|"
      puts
      puts "OERCOMMONS"
      puts "----------"
      puts "P = " + (final_precision_oercommons / participants.size).to_s
      puts "R = " + (final_recall_oercommons / participants.size).to_s
      puts "F1 = " + (final_f1_oercommons / participants.size).to_s
      puts          
      puts "MERLOT"
      puts "-------"            
      puts "P = " + (final_precision_merlot / participants.size).to_s
      puts "R = " + (final_recall_merlot / participants.size).to_s
      puts "F1 = " + (final_f1_merlot / participants.size).to_s
      puts                  
      puts "CNX"  
      puts "----"
      puts "P = " + (final_precision_cnx / participants.size).to_s
      puts "R = " + (final_recall_cnx / participants.size).to_s
      puts "F1 = " + (final_f1_cnx / participants.size).to_s
      final_precision_oercommons = 0.0
      final_precision_merlot = 0.0
      final_precision_cnx = 0.0
      final_recall_oercommons = 0.0
      final_recall_merlot = 0.0
      final_recall_cnx = 0.0
      final_f1_oercommons = 0.0
      final_f1_merlot = 0.0
      final_f1_cnx = 0.0     
   rescue Exception => e
      puts "Exception human_evaluation_metrics"
      puts e.message
      puts e.backtrace.inspect
   end
end

def croera_vs_repository
   begin
      total_precision_oercommons = 0.0
      total_precision_merlot = 0.0
      total_precision_cnx = 0.0
      total_recall_oercommons = 0.0
      total_recall_merlot = 0.0
      total_recall_cnx = 0.0
      total_f1_oercommons = 0.0
      total_f1_merlot = 0.0
      total_f1_cnx = 0.0
      final_precision_oercommons = 0.0
      final_precision_merlot = 0.0
      final_precision_cnx = 0.0
      final_recall_oercommons = 0.0
      final_recall_merlot = 0.0
      final_recall_cnx = 0.0
      final_f1_oercommons = 0.0
      final_f1_merlot = 0.0
      final_f1_cnx = 0.0
      number_of_documents_oercommons = 0      
      number_of_documents_merlot = 0
      number_of_documents_cnx = 0
      evaluation_categories_oercommons = Array.new
      evaluation_categories_merlot = Array.new
      evaluation_categories_cnx = Array.new     
      evaluation_categories = Array.new
      documents_evaluated_per_participant = Array.new
      participants = Array.new
      total_documents_evaluated = Array.new
      all_participants = Participant.all
      all_participants.each do |participant|
         if participant.evaluations.size != 0
            participants << participant
         end
      end
      #participants = Participant.where(:id => 100)
      participants.each do |participant|
         evaluations = Evaluation.where(:participant_id => participant.id)
         evaluations.each do |evaluation|
            total_documents_evaluated << evaluation.document_id
         end
      end
      total_documents_evaluated = total_documents_evaluated.uniq
      puts total_documents_evaluated.size        
         
         
         #puts documents_evaluated_per_participant  
         #puts
         total_documents_evaluated.each do |document_id|
            puts
            puts "--------------------------------------------------------"
            puts "Document: " + document_id.to_s
            evaluation_categories_oercommons.clear
            evaluation_categories_merlot.clear
            evaluation_categories_cnx.clear            
            
            document_categories_temp = Array.new
            
            document_categories = Document.where(:id => document_id).first.original_category.split(",")
            document_categories.each do |document|
               document_categories_temp << document.strip
            end
            document_categories = document_categories_temp
            
            repository  = Document.where(:id => document_id).first.corpus
            

            
            if repository == "oercommons"
               evaluation_categories_oercommons = Document.where(:id => document_id).first.classified_in_category_oercommons.split(",")
                number_of_documents_oercommons += 1
            elsif repository == "merlot"
               evaluation_categories_merlot = Document.where(:id => document_id).first.classified_in_category_merlot.split(",")
number_of_documents_merlot += 1
            elsif repository == "cnx"
               evaluation_categories_cnx = Document.where(:id => document_id).first.classified_in_category_cnx.split(",")
number_of_documents_cnx += 1
            end
            puts "ddddddddddddddddddddddddddddddddddddd"
                        puts "ddddddddddddddddddddddddddddddddddddd"
                                    puts "ddddddddddddddddddddddddddddddddddddd"
                                                puts "ddddddddddddddddddddddddddddddddddddd"
            puts number_of_documents_oercommons
            puts number_of_documents_merlot
            puts number_of_documents_cnx
                        puts "ddddddddddddddddddddddddddddddddddddd"
                                    puts "ddddddddddddddddddddddddddddddddddddd"
                                                puts "ddddddddddddddddddddddddddddddddddddd"
                  
            #puts "||||" +  repository  +  "||||"  
            #puts

            if repository == "oercommons"
               evaluation_categories = evaluation_categories_oercommons
               document_categories = document_categories 
            elsif repository == "merlot"
               evaluation_categories = evaluation_categories_merlot
               document_categories = document_categories
            elsif repository == "cnx"
               evaluation_categories = evaluation_categories_cnx
               document_categories = document_categories
            end
               
            puts "EVALUATION CATEGORIES"
            puts evaluation_categories
            puts
            puts "DOCUMENT CATEGORIES"
            puts document_categories
            puts
            tp = (evaluation_categories & document_categories).size
            fn = (document_categories - evaluation_categories).size
            fp = (evaluation_categories - document_categories).size
            #puts "TP"
            #puts tp
            #puts "FP"
            #puts fp
            #puts "FN"
            #puts fn
            if (tp + fp) == 0
               precision = 0
            else 
               precision = tp / (tp + fp)
            end
                                  
            if (tp + fn) == 0
               recall = 0
            else
               recall = tp / (tp + fn)
            end
                                       
            if precision == 0 and recall == 0
               f1 = 0
            else
               f1 = (2*precision*recall) / (precision + recall)
            end
            
            puts "Repository: " + repository
            puts "Precision: " + precision.to_s
            puts "Recall: " + recall.to_s
            puts "F1-score: " + f1.to_s
            puts
            
            if repository == "oercommons"
               total_precision_oercommons = total_precision_oercommons + precision
               total_recall_oercommons = total_recall_oercommons + recall
               total_f1_oercommons = total_f1_oercommons + f1                       
            elsif repository == "merlot"
               total_precision_merlot = total_precision_merlot + precision
               total_recall_merlot = total_recall_merlot + recall
               total_f1_merlot = total_f1_merlot + f1        
            elsif repository == "cnx"
               total_precision_cnx = total_precision_cnx + precision
               total_recall_cnx = total_recall_cnx + recall
               total_f1_cnx = total_f1_cnx + f1        
            end
                                           
         end
         puts " ________________________"
         puts "|                        |"                
         puts "| TOTAL_METRICS_PER_USER |"
         puts "|________________________|"
         puts
         puts "OERCOMMONS"
         if number_of_documents_oercommons != 0
            puts total_precision_oercommons = total_precision_oercommons / number_of_documents_oercommons
            puts total_recall_oercommons = total_recall_oercommons / number_of_documents_oercommons
            puts total_f1_oercommons = total_f1_oercommons / number_of_documents_oercommons
         end
         puts          
         puts "MERLOT"
         if number_of_documents_merlot != 0            
            puts total_precision_merlot = total_precision_merlot / number_of_documents_merlot
            puts total_recall_merlot = total_recall_merlot / number_of_documents_merlot
            puts total_f1_merlot = total_f1_merlot / number_of_documents_merlot
         puts                  
         end
         puts "CNX"
         if number_of_documents_cnx != 0  
            puts total_precision_cnx = total_precision_cnx / number_of_documents_cnx
            puts total_recall_cnx = total_recall_cnx / number_of_documents_cnx
            puts total_f1_cnx = total_f1_cnx / number_of_documents_cnx
         end
         
         final_precision_oercommons = final_precision_oercommons + total_precision_oercommons
         final_recall_oercommons = final_recall_oercommons + total_recall_oercommons
         final_f1_oercommons = final_f1_oercommons + total_f1_oercommons
         final_precision_merlot = final_precision_merlot + total_precision_merlot
         final_recall_merlot = final_recall_merlot + total_recall_merlot
         final_f1_merlot = final_f1_merlot + total_f1_merlot
         final_precision_cnx = final_precision_cnx + total_precision_cnx
         final_recall_cnx = final_recall_cnx + total_recall_cnx
         final_f1_cnx = final_f1_cnx + total_f1_cnx
         total_precision_oercommons = 0.0
         total_precision_merlot = 0.0
         total_precision_cnx = 0.0
         total_recall_oercommons = 0.0
         total_recall_merlot = 0.0
         total_recall_cnx = 0.0
         total_f1_oercommons = 0.0
         total_f1_merlot = 0.0
         total_f1_cnx = 0.0
         number_of_documents_oercommons = 0      
         number_of_documents_merlot = 0
         number_of_documents_cnx = 0         
      
        
    
   rescue Exception => e
      puts "Exception human_evaluation_metrics"
      puts e.message
      puts e.backtrace.inspect
   end
end

def human_judgement_vs_repository(best_participants)
   begin
      total_precision_oercommons = 0.0
      total_precision_merlot = 0.0
      total_precision_cnx = 0.0
      total_recall_oercommons = 0.0
      total_recall_merlot = 0.0
      total_recall_cnx = 0.0
      total_f1_oercommons = 0.0
      total_f1_merlot = 0.0
      total_f1_cnx = 0.0
      final_precision_oercommons = 0.0
      final_precision_merlot = 0.0
      final_precision_cnx = 0.0
      final_recall_oercommons = 0.0
      final_recall_merlot = 0.0
      final_recall_cnx = 0.0
      final_f1_oercommons = 0.0
      final_f1_merlot = 0.0
      final_f1_cnx = 0.0
      number_of_documents_oercommons = 0      
      number_of_documents_merlot = 0
      number_of_documents_cnx = 0
      evaluation_categories_oercommons = Array.new
      evaluation_categories_merlot = Array.new
      evaluation_categories_cnx = Array.new     
      evaluation_categories = Array.new
      documents_evaluated_per_participant = Array.new
      participants = Array.new
      total_documents_evaluated = Array.new
      all_participants = Participant.all
      all_participants.each do |participant|
      best_participants_0_7 = [77,87,105,106,113,125,137,158,164,168,183,189]
      best_participants_0_8 = [87,137,164]
      best_participants_0_75 = [77,87,105,113,137,164,183]
         #if participant.evaluations.size != 0 (esto es para cuando son all participants)
         if best_participants.include? participant.id 
            participants << participant
         end
      end
      #participants = Participant.where(:id => 100)
      participants.each do |participant|
         evaluations = Evaluation.where(:participant_id => participant.id)
         evaluations.each do |evaluation|
            total_documents_evaluated << evaluation.document_id
         end
      end
      total_documents_evaluated = total_documents_evaluated.uniq
      puts total_documents_evaluated.size        
         
         
         #puts documents_evaluated_per_participant  
         #puts
         total_documents_evaluated.each do |document_id|
            puts
            puts "--------------------------------------------------------"
            puts "Document: " + document_id.to_s
            evaluation_categories_oercommons.clear
            evaluation_categories_merlot.clear
            evaluation_categories_cnx.clear            
            
            document_categories_temp = Array.new
            
            document_categories = Document.where(:id => document_id).first.original_category.split(",")
            document_categories.each do |document|
               document_categories_temp << document.strip
            end
            document_categories = document_categories_temp
            
            repository  = Document.where(:id => document_id).first.corpus
            

            
            if repository == "oercommons"
               Evaluation.where(:document_id => document_id, :corpus_taxonomy => "oercommons").each do |evaluation|
                  evaluation_categories_oercommons <<  evaluation.category
               end
               number_of_documents_oercommons += 1
            elsif repository == "merlot"
               Evaluation.where(:document_id => document_id, :corpus_taxonomy => "merlot").each do |evaluation|
                  evaluation_categories_merlot <<  evaluation.category
               end
               number_of_documents_merlot += 1
            elsif repository == "cnx"
               Evaluation.where(:document_id => document_id, :corpus_taxonomy => "cnx").each do |evaluation|
                  evaluation_categories_cnx <<  evaluation.category
               end
               number_of_documents_cnx += 1
            end
            puts "ddddddddddddddddddddddddddddddddddddd"
            puts "ddddddddddddddddddddddddddddddddddddd"
            puts "ddddddddddddddddddddddddddddddddddddd"
            puts "ddddddddddddddddddddddddddddddddddddd"
            puts number_of_documents_oercommons
            puts number_of_documents_merlot
            puts number_of_documents_cnx
            puts "ddddddddddddddddddddddddddddddddddddd"
            puts "ddddddddddddddddddddddddddddddddddddd"
            puts "ddddddddddddddddddddddddddddddddddddd"
                  
            #puts "||||" +  repository  +  "||||"  
            #puts

            if repository == "oercommons"
               evaluation_categories = evaluation_categories_oercommons
               document_categories = document_categories 
            elsif repository == "merlot"
               evaluation_categories = evaluation_categories_merlot
               document_categories = document_categories
            elsif repository == "cnx"
               evaluation_categories = evaluation_categories_cnx
               document_categories = document_categories
            end
               
            puts "EVALUATION CATEGORIES"
            puts evaluation_categories
            puts
            puts "DOCUMENT CATEGORIES"
            puts document_categories
            puts
            tp = (evaluation_categories & document_categories).size
            fn = (document_categories - evaluation_categories).size
            fp = (evaluation_categories - document_categories).size
            #puts "TP"
            #puts tp
            #puts "FP"
            #puts fp
            #puts "FN"
            #puts fn
            if (tp + fp) == 0
               precision = 0
            else 
               precision = tp / (tp + fp)
            end
                                  
            if (tp + fn) == 0
               recall = 0
            else
               recall = tp / (tp + fn)
            end
                                       
            if precision == 0 and recall == 0
               f1 = 0
            else
               f1 = (2*precision*recall) / (precision + recall)
            end
            
            puts "Repository: " + repository
            puts "Precision: " + precision.to_s
            puts "Recall: " + recall.to_s
            puts "F1-score: " + f1.to_s
            puts
            
            if repository == "oercommons"
               total_precision_oercommons = total_precision_oercommons + precision
               total_recall_oercommons = total_recall_oercommons + recall
               total_f1_oercommons = total_f1_oercommons + f1                       
            elsif repository == "merlot"
               total_precision_merlot = total_precision_merlot + precision
               total_recall_merlot = total_recall_merlot + recall
               total_f1_merlot = total_f1_merlot + f1        
            elsif repository == "cnx"
               total_precision_cnx = total_precision_cnx + precision
               total_recall_cnx = total_recall_cnx + recall
               total_f1_cnx = total_f1_cnx + f1        
            end
                                           
         end
         puts " ________________________"
         puts "|                        |"                
         puts "| TOTAL_METRICS_PER_USER |"
         puts "|________________________|"
         puts
         puts "OERCOMMONS"
         if number_of_documents_oercommons != 0
            puts total_precision_oercommons = total_precision_oercommons / number_of_documents_oercommons
            puts total_recall_oercommons = total_recall_oercommons / number_of_documents_oercommons
            puts total_f1_oercommons = total_f1_oercommons / number_of_documents_oercommons
         end
         puts          
         puts "MERLOT"
         if number_of_documents_merlot != 0            
            puts total_precision_merlot = total_precision_merlot / number_of_documents_merlot
            puts total_recall_merlot = total_recall_merlot / number_of_documents_merlot
            puts total_f1_merlot = total_f1_merlot / number_of_documents_merlot
         puts                  
         end
         puts "CNX"
         if number_of_documents_cnx != 0  
            puts total_precision_cnx = total_precision_cnx / number_of_documents_cnx
            puts total_recall_cnx = total_recall_cnx / number_of_documents_cnx
            puts total_f1_cnx = total_f1_cnx / number_of_documents_cnx
         end
         
         final_precision_oercommons = final_precision_oercommons + total_precision_oercommons
         final_recall_oercommons = final_recall_oercommons + total_recall_oercommons
         final_f1_oercommons = final_f1_oercommons + total_f1_oercommons
         final_precision_merlot = final_precision_merlot + total_precision_merlot
         final_recall_merlot = final_recall_merlot + total_recall_merlot
         final_f1_merlot = final_f1_merlot + total_f1_merlot
         final_precision_cnx = final_precision_cnx + total_precision_cnx
         final_recall_cnx = final_recall_cnx + total_recall_cnx
         final_f1_cnx = final_f1_cnx + total_f1_cnx
         total_precision_oercommons = 0.0
         total_precision_merlot = 0.0
         total_precision_cnx = 0.0
         total_recall_oercommons = 0.0
         total_recall_merlot = 0.0
         total_recall_cnx = 0.0
         total_f1_oercommons = 0.0
         total_f1_merlot = 0.0
         total_f1_cnx = 0.0
         number_of_documents_oercommons = 0      
         number_of_documents_merlot = 0
         number_of_documents_cnx = 0         
      
        
    
   rescue Exception => e
      puts "Exception human_evaluation_metrics"
      puts e.message
      puts e.backtrace.inspect
   end
end


def participant_performance_human_judgement(participant_identifier)
   #measure the performance of the human classification compared to real classification (the original classification in the repository)
   begin
      total_precision_oercommons = 0.0
      total_precision_merlot = 0.0
      total_precision_cnx = 0.0
      total_precision = 0.0
      total_recall = 0.0
      total_f1 = 0.0
      total_recall_oercommons = 0.0
      total_recall_merlot = 0.0
      total_recall_cnx = 0.0
      total_f1_oercommons = 0.0
      total_f1_merlot = 0.0
      total_f1_cnx = 0.0
      final_precision_oercommons = 0.0
      final_precision_merlot = 0.0
      final_precision_cnx = 0.0
      final_recall_oercommons = 0.0
      final_recall_merlot = 0.0
      final_recall_cnx = 0.0
      final_f1_oercommons = 0.0
      final_f1_merlot = 0.0
      final_f1_cnx = 0.0
      final_precision = 0.0
      final_recall = 0.0
      final_f1 = 0.0
      number_of_documents_oercommons = 0      
      number_of_documents_merlot = 0
      number_of_documents_cnx = 0
      evaluations = Array.new
      evaluation_categories_oercommons = Array.new
      evaluation_categories_merlot = Array.new
      evaluation_categories_cnx = Array.new     
      evaluation_categories = Array.new
      documents_evaluated_per_participant = Array.new
      participants = Array.new
      total_documents_evaluated = Array.new
      all_participants = Participant.all
      all_participants.each do |participant|
         if participant.evaluations.size != 0
            participants << participant
         end
      end
      #participants = Participant.where(:id => 100)
      participants.each do |participant|
         evaluations = Evaluation.where(:participant_id => participant_identifier).where("corpus_taxonomy = corpus_resource")
         evaluations.each do |evaluation|
            total_documents_evaluated << evaluation.document_id
         end
      end
      
      
      total_documents_evaluated = total_documents_evaluated.uniq
      puts total_documents_evaluated.size   
      puts total_documents_evaluated     
         
         
         #puts documents_evaluated_per_participant  
         #puts
         total_documents_evaluated.each do |document_id|
            puts
            puts "--------------------------------------------------------"
            puts "Document: " + document_id.to_s
            evaluation_categories.clear     
            
            document_categories_temp = Array.new
            
            document_categories = Document.where(:id => document_id).first.original_category.split(",")
            document_categories.each do |document|
               document_categories_temp << document.strip
            end
            document_categories = document_categories_temp
            
            repository  = Document.where(:id => document_id).first.corpus
            
            evaluations = Evaluation.where(:participant_id => participant_identifier).where(:document_id => document_id).where("corpus_taxonomy = corpus_resource")
                                 
            evaluations.each do |evaluation|
               evaluation_categories <<  evaluation.category
            end
               
            puts "EVALUATION CATEGORIES"
            puts evaluation_categories
            puts
            puts "DOCUMENT CATEGORIES"
            puts document_categories
            puts
            tp = (evaluation_categories & document_categories).size
            fn = (document_categories - evaluation_categories).size
            fp = (evaluation_categories - document_categories).size

            if (tp + fp) == 0
               precision = 0
            else 
               precision = tp / (tp + fp)
            end
                                  
            if (tp + fn) == 0
               recall = 0
            else
               recall = tp / (tp + fn)
            end
                                       
            if precision == 0 and recall == 0
               f1 = 0
            else
               f1 = (2*precision*recall) / (precision + recall)
            end
            
            puts "Repository: " + repository
            puts "Precision: " + precision.to_s
            puts "Recall: " + recall.to_s
            puts "F1-score: " + f1.to_s
            puts
            
            total_precision = total_precision + precision
            total_recall = total_recall + recall
            total_f1 = total_f1 + f1                       

                                           
         end
         puts " ________________________"
         puts "|                        |"                
         puts "| TOTAL_METRICS_PER_USER |"
         puts "|________________________|"
         puts
                 
         number_of_documents = total_documents_evaluated.size

         puts total_precision = total_precision / number_of_documents
         puts total_recalls = total_recall / number_of_documents
         puts total_f1 = total_f1 / number_of_documents
         
         final_precision = final_precision+ total_precision
         final_recall= final_recall + total_recall
         final_f1 = final_f1 + total_f1

         participant_f1 = total_f1

         total_precision = 0.0
         total_recall = 0.0
         total_f1 = 0.0

         number_of_documents_oercommons = 0      
         number_of_documents_merlot = 0
         number_of_documents_cnx = 0       
         
         
         return participant_f1
      
        
    
   rescue Exception => e
      puts "Exception human_evaluation_metrics"
      puts e.message
      puts e.backtrace.inspect
   end
end


def performance_human_judgement(lower_threshold, upper_threshold)
   begin
      contador = 0
      best_participants = Array.new
      Participant.all.each do |participant|
         participant_f1 = participant_performance_human_judgement(participant.id)
         if participant_f1 >= lower_threshold and participant_f1 < upper_threshold
            contador+=1 
            best_participants << participant.id
            puts participant.id
            puts participant_f1
         end
      end
      
      puts
      #puts "Number of participants with F1 >= " + threshold.to_s
      puts "Number of participants with F1 >= " + lower_threshold.to_s  + " and F1 < " + upper_threshold.to_s  
      puts contador
      puts
      puts "Best Participants"
      puts best_participants
      puts
      
      human_judgement_vs_repository(best_participants)
      
      puts "Best Participants"
      puts best_participants.size
      
      human_evaluation(best_participants)
      
      human_evaluation_metrics(best_participants)
    
   rescue Exception => e
      puts "Exception performance_human_judgement"
      puts e.message
      puts e.backtrace.inspect
   end
end



   
   

end