# encoding: utf-8

require 'capybara/rails'
require "capybara"
require "capybara/dsl"
require "nokogiri"

class ScraperIeee
   include ActionView::Helpers::SanitizeHelper
   include Capybara::DSL
   def obtain_non_ambiguous_journals(*reintentos)
      begin
         
         if reintentos[0]==1
            reintentos = reintentos[1].to_i
         else
            reintentos = 2
         end
                 
         topics = ["http://ieeexplore.ieee.org/xpl/periodicalsByTopic.jsp?item=Aerospace",
            "http://ieeexplore.ieee.org/xpl/periodicalsByTopic.jsp?item=Bioengineering",
            "http://ieeexplore.ieee.org/xpl/periodicalsByTopic.jsp?item=Communication%2C%20Networking%20.AND.%20Broadcasting",
            "http://ieeexplore.ieee.org/xpl/periodicalsByTopic.jsp?item=Components%2C%20Circuits%2C%20Devices%20.AND.%20Systems",
            "http://ieeexplore.ieee.org/xpl/periodicalsByTopic.jsp?item=Computing%20.AND.%20Processing%20.LB.Hardware/Software.RB.",
            "http://ieeexplore.ieee.org/xpl/periodicalsByTopic.jsp?item=Engineered%20Materials%2C%20Dielectrics%20.AND.%20Plasmas",
            "http://ieeexplore.ieee.org/xpl/periodicalsByTopic.jsp?item=Engineering%20Profession",
            "http://ieeexplore.ieee.org/xpl/periodicalsByTopic.jsp?item=Fields%2C%20Waves%20.AND.%20Electromagnetics",
            "http://ieeexplore.ieee.org/xpl/periodicalsByTopic.jsp?item=General%20Topics%20for%20Engineers%20.LB.Math%2C%20Science%20.AND.%20Engineering.RB.",
            "http://ieeexplore.ieee.org/xpl/periodicalsByTopic.jsp?item=Geoscience",
            "http://ieeexplore.ieee.org/xpl/periodicalsByTopic.jsp?item=Nuclear%20Engineering",
            "http://ieeexplore.ieee.org/xpl/periodicalsByTopic.jsp?item=Photonics%20.AND.%20Electro-Optics",
            "http://ieeexplore.ieee.org/xpl/periodicalsByTopic.jsp?item=Power%2C%20Energy%2C%20.AND.%20Industry%20Applications",
            "http://ieeexplore.ieee.org/xpl/periodicalsByTopic.jsp?item=Robotics%20.AND.%20Control%20Systems",
            "http://ieeexplore.ieee.org/xpl/periodicalsByTopic.jsp?item=Signal%20Processing%20.AND.%20Analysis",
            "http://ieeexplore.ieee.org/xpl/periodicalsByTopic.jsp?item=Transportation"]         
            
         topics.each do |topic|
            page = Nokogiri::HTML(open(topic))
            page.css("li.noTitleHistory div.header div.detail div.reveal-content-title-full h3.journals-content-title a").each do |journal|
               title = journal.text.strip
               url = journal['href']           
               journal = Report.new
               journal.name = title
               journal.url = url 
               journal.scraped_from = topic.split("item=")[1].strip.gsub("%2C"," ").gsub("%20"," ")
               journal.save
               journal.reload
               Sunspot.index journal
               Sunspot.commit              
            end
            i=2          
            if !page.css("ul.pagination li a").empty?
               while page.css("ul.pagination li a").last['title'] == "Last"
                  topic = topic + "&pageNumber=" + i.to_s
                  page = Nokogiri::HTML(open(topic))
                  page.css("li.noTitleHistory div.header div.detail div.reveal-content-title-full h3.journals-content-title a").each do |journal|
                     title = journal.text.strip
                     url = journal['href']    
                     journal = Report.new
                     journal.name = title
                     journal.url = url     
                     journal.scraped_from = topic.split("item=")[1].split("&pageNumber")[0].strip.gsub("%2C"," ").gsub("%20"," ")         
                     journal.save
                     journal.reload
                     Sunspot.index journal
                     Sunspot.commit             
                  end    
                  i+=1                         
               end
            end
         end
                      
         j = 0     
         Report.all.each do |journal|
            if Report.where(:name => journal.name, :url => journal.url).size > 1
               Report.where(:name => journal.name, :url => journal.url).destroy_all
            end
         end
             
         reintentos = 2
      rescue Exception => e
         puts "Exception obtain_non_ambiguous_journals"
         puts e.message
         puts e.backtrace.inspect
         puts reintentos
         if reintentos > 0
            reintentos-=1
            sleep 3
            obtain_non_ambiguous_journals(1, reintentos)
         end
      end
   end


   def scrape_ieee(*reintentos)
      begin
         
         if reintentos[0]==1
            reintentos = reintentos[1].to_i    
         else
            $aerospace_counter = 0
            $bioengineering_counter = 0
            $com_networking_counter = 0
            $comp_circuits_counter = 0
            $comp_processing_counter = 0
            $eng_materials_counter = 0
            $eng_profession_counter = 0
            $field_waves_counter = 0
            $gen_topics_counter = 0
            $geoscience_counter = 0
            $nuclear_counter = 0
            $photonics_counter = 0
            $power_energy_counter = 0
            $robotics_counter = 0
            $sigal_processing_counter = 0
            $transportation_counter = 0                 
            reintentos = 50
         end
         
         topics = [{:topic => "Aerospace", :limit => 700, :counter => $aerospace_counter},
            {:topic => "Bioengineering", :limit => 235, :counter => $bioengineering_counter},
            {:topic => "Communication  Networking .AND. Broadcasting",:limit => 80, :counter => $com_networking_counter},
            {:topic => "Components  Circuits  Devices .AND. Systems",:limit => 175, :counter => $comp_circuits_counter},
            {:topic => "Computing .AND. Processing .LB.Hardware/Software.RB.",:limit => 35, :counter => $comp_processing_counter},
            {:topic => "Engineered Materials  Dielectrics .AND. Plasmas",:limit => 700, :counter => $eng_materials_counter},
            {:topic => "Engineering Profession",:limit => 175, :counter => $eng_profession_counter},
            {:topic => "Fields  Waves .AND. Electromagnetics",:limit => 80, :counter => $field_waves_counter},
            {:topic => "General Topics for Engineers .LB.Math  Science .AND. Engineering.RB.",:limit => 350, :counter => $gen_topics_counter},
            {:topic => "Geoscience",:limit => 350, :counter => $geoscience_counter},
            {:topic => "Nuclear Engineering",:limit => 700, :counter => $nuclear_counter},
            {:topic => "Photonics .AND. Electro-Optics",:limit => 235, :counter => $photonics_counter},
            {:topic => "Power  Energy  .AND. Industry Applications",:limit => 100, :counter => $power_energy_counter},
            {:topic => "Robotics .AND. Control Systems",:limit => 235, :counter => $robotics_counter},
            {:topic => "Signal Processing .AND. Analysis",:limit => 100, :counter => $sigal_processing_counter},
            {:topic => "Transportation",:limit => 350, :counter => $transportation_counter}]     
          

         
         Report.all.each do |journal|
            if journal.owner_type != "scraped"    
               volumes = Array.new            
               puts "NUEVO JOURNAL" 
               #puts "JOURNAL NAME: " + journal.name
               limit = journal.owner_id
               topic = journal.scraped_from 
               url = "http://ieeexplore.ieee.org" + journal.url
               puts url
               page = Nokogiri::HTML(open(url))
               latest_articles = page.css("div.section div.content span.more a")[0]['href']
               articles_page = Nokogiri::HTML(open("http://ieeexplore.ieee.org/xpl/" + latest_articles))
               articles_page.css("div#past-issues div.volumes div.level ul li a").each do |volume|
                  hash = {:url =>"http://ieeexplore.ieee.org" + volume['href'], :year => volume.parent.parent['id'].split("pi-")[1].strip}
                  volumes << hash
               end
               volumes = volumes.sort_by { |hsh| hsh[:year] }
               volumes = volumes.reverse
               volumes.each do |volume|
                  puts "limit"
                  puts limit
                  puts "counter"           
                  case topic
                     when
                        "Aerospace" 
                        counter = $aerospace_counter
                     when               
                        "Bioengineering"
                        counter = $bioengineering_counter
                     when
                        "Communication  Networking .AND. Broadcasting" 
                        counter = $com_networking_counter 
                     when
                        "Components  Circuits  Devices .AND. Systems" 
                        counter = $comp_circuits_counter 
                     when
                        "Computing .AND. Processing .LB.Hardware/Software.RB." 
                        counter = $comp_processing_counter 
                     when
                        "Engineered Materials  Dielectrics .AND. Plasmas"
                        counter = $eng_materials_counter 
                     when
                        "Engineering Profession" 
                        counter = $eng_profession_counter 
                     when
                        "Fields  Waves .AND. Electromagnetics" 
                        counter = $field_waves_counter 
                     when
                        "General Topics for Engineers .LB.Math  Science .AND. Engineering.RB." 
                        counter = $gen_topics_counter 
                     when
                        "Geoscience" 
                        counter = $geoscience_counter 
                     when
                        "Nuclear Engineering" 
                        counter = $nuclear_counter 
                     when
                        "Photonics .AND. Electro-Optics" 
                        counter = $photonics_counter 
                     when
                        "Power  Energy  .AND. Industry Applications" 
                        counter = $power_energy_counter 
                     when
                        "Robotics .AND. Control Systems" 
                        counter = $robotics_counter 
                     when
                        "Signal Processing .AND. Analysis"
                        counter = $sigal_processing_counter 
                     when
                        "Transportation" 
                        counter = $transportation_counter 
                  end
                  puts counter
                  if counter > limit
                     case topic
                        when
                           "Aerospace" 
                          $aerospace_counter = 0
                        when               
                           "Bioengineering"
                          $bioengineering_counter = 0
                        when
                           "Communication  Networking .AND. Broadcasting" 
                          $com_networking_counter = 0 
                        when
                           "Components  Circuits  Devices .AND. Systems" 
                          $comp_circuits_counter = 0 
                        when
                           "Computing .AND. Processing .LB.Hardware/Software.RB." 
                          $comp_processing_counter = 0 
                        when
                           "Engineered Materials  Dielectrics .AND. Plasmas"
                          $eng_materials_counter = 0 
                        when
                           "Engineering Profession" 
                          $eng_profession_counter = 0 
                        when
                           "Fields  Waves .AND. Electromagnetics" 
                          $field_waves_counter = 0 
                        when
                           "General Topics for Engineers .LB.Math  Science .AND. Engineering.RB." 
                          $gen_topics_counter = 0 
                        when
                           "Geoscience" 
                          $geoscience_counter = 0 
                        when
                           "Nuclear Engineering" 
                          $nuclear_counter = 0 
                        when
                           "Photonics .AND. Electro-Optics" 
                          $photonics_counter = 0 
                        when
                           "Power  Energy  .AND. Industry Applications" 
                          $power_energy_counter = 0 
                        when
                           "Robotics .AND. Control Systems" 
                          $robotics_counter = 0 
                        when
                           "Signal Processing .AND. Analysis"
                          $sigal_processing_counter = 0 
                        when
                           "Transportation" 
                          $transportation_counter = 0 
                     end
                     journal.owner_type = "scraped"
                     journal.save
                     puts "SE ALCANZO EL LÍMITE"
                     break
                  else
                     scrape_volume_ieee volume[:url], topic
                  end
               end
            end
         end        
         
         reintentos = 50
      rescue Exception => e
         puts "Exception scrape_ieee"
         puts e.message
         puts e.backtrace.inspect
         puts reintentos
         if reintentos > 0
            reintentos-=1
            sleep 3
            scrape_ieee(1, reintentos)
         end
      end
   end


   def scrape_volume_ieee(volume_url, topic, *reintentos)
      begin
         
         puts "VOLUME_URL"
         puts volume_url
         
         if reintentos[0]==1
            reintentos = reintentos[1].to_i
         else
            reintentos = 2
         end
         
         volume_page = Nokogiri::HTML(open(volume_url))
                        
         date = volume_page.css("div#jrnl-issue-hdr.header h2")[0].text.split("Date")[1].strip                  
                        
         volume_page.css("li div.txt h3").each do |article|
            if !article.css("a").empty?
               article_url = "http://ieeexplore.ieee.org" + article.css("a")[0]['href']
               scrape_article_ieee article_url, topic, date
            end
         end
                  
         reintentos = 2
         
      rescue Exception => e
         puts "Exception scrape_volume_ieee"
         puts e.message
         puts e.backtrace.inspect
         puts reintentos
         if reintentos > 0
            reintentos-=1
            sleep 3
            scrape_volume_ieee(volume_url,topic, 1, reintentos)
         end
      end
   end


   def scrape_article_ieee(article_url, topic, date, *reintentos)
      begin
             
         topics = [{:topic => "Aerospace", :limit => 700, :counter => $aerospace_counter},
            {:topic => "Bioengineering", :limit => 235, :counter => $bioengineering_counter},
            {:topic => "Communication  Networking .AND. Broadcasting",:limit => 80, :counter => $com_networking_counter},
            {:topic => "Components  Circuits  Devices .AND. Systems",:limit => 175, :counter => $comp_circuits_counter},
            {:topic => "Computing .AND. Processing .LB.Hardware/Software.RB.",:limit => 35, :counter => $comp_processing_counter},
            {:topic => "Engineered Materials  Dielectrics .AND. Plasmas",:limit => 700, :counter => $eng_materials_counter},
            {:topic => "Engineering Profession",:limit => 175, :counter => $eng_profession_counter},
            {:topic => "Fields  Waves .AND. Electromagnetics",:limit => 80, :counter => $field_waves_counter},
            {:topic => "General Topics for Engineers .LB.Math  Science .AND. Engineering.RB.",:limit => 350, :counter => $gen_topics_counter},
            {:topic => "Geoscience",:limit => 350, :counter => $geoscience_counter},
            {:topic => "Nuclear Engineering",:limit => 700, :counter => $nuclear_counter},
            {:topic => "Photonics .AND. Electro-Optics",:limit => 235, :counter => $photonics_counter},
            {:topic => "Power  Energy  .AND. Industry Applications",:limit => 100, :counter => $power_energy_counter},
            {:topic => "Robotics .AND. Control Systems",:limit => 235, :counter => $robotics_counter},
            {:topic => "Signal Processing .AND. Analysis",:limit => 100, :counter => $sigal_processing_counter},
            {:topic => "Transportation",:limit => 350, :counter => $transportation_counter}]     
                 
                
         if ReutersNewItem.where(:file_id => article_url).size == 0      
            article_page = Nokogiri::HTML(open(article_url))
                 
            abstract = article_page.css("div.article p")[0].text.strip
            
            puts "ABSTRACT"       
            puts abstract
            puts "TOPIC: " + topic
            puts "DATE: " + date                                
            puts
                          
            scraped_article = ReutersNewItem.new
            
            scraped_article.description = abstract
            scraped_article.topics = topic
            scraped_article.dateline = date
            scraped_article.file_id = article_url
            scraped_article.save     
            
            case topic
            when
               "Aerospace" 
               $aerospace_counter += 1
            when               
               "Bioengineering"
               $bioengineering_counter += 1
            when
               "Communication  Networking .AND. Broadcasting" 
               $com_networking_counter += 1
            when
               "Components  Circuits  Devices .AND. Systems" 
               $comp_circuits_counter += 1
            when
               "Computing .AND. Processing .LB.Hardware/Software.RB." 
               $comp_processing_counter += 1
            when
               "Engineered Materials  Dielectrics .AND. Plasmas"
               $eng_materials_counter += 1
            when
               "Engineering Profession" 
               $eng_profession_counter += 1
            when
               "Fields  Waves .AND. Electromagnetics" 
               $field_waves_counter += 1
            when
               "General Topics for Engineers .LB.Math  Science .AND. Engineering.RB." 
               $gen_topics_counter += 1
            when
               "Geoscience" 
               $geoscience_counter += 1
            when
               "Nuclear Engineering" 
               $nuclear_counter += 1
            when
               "Photonics .AND. Electro-Optics" 
               $photonics_counter += 1
            when
               "Power  Energy  .AND. Industry Applications" 
               $power_energy_counter += 1
            when
               "Robotics .AND. Control Systems" 
               $robotics_counter += 1
            when
               "Signal Processing .AND. Analysis"
               $sigal_processing_counter += 1
            when
               "Transportation" 
               $transportation_counter += 1
            end
            
            puts "AEROSPACE"
            puts $aerospace_counter
            puts "BIOINGENIERIA"
            puts $bioengineering_counter
            puts "COMM NETWORKING"
            puts $com_networking_counter                                           
         else
            puts "The article already exists"
         end
         
         reintentos = 2
      rescue Exception => e
         puts "Exception scrape_article_ieee"
         puts e.message
         puts e.backtrace.inspect
      end
   end
   
   
   def prueba  
         volumes = Array.new            
         puts "NUEVO JOURNAL" 
         topic = "Bioengineering"
         url = "http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=11102"
         puts url
         page = Nokogiri::HTML(open(url))
         latest_articles = page.css("div.section div.content span.more a")[0]['href']
         articles_page = Nokogiri::HTML(open("http://ieeexplore.ieee.org/xpl/" + latest_articles))
         articles_page.css("div#past-issues div.volumes div.level ul li a").each do |volume|
            hash = {:url =>"http://ieeexplore.ieee.org" + volume['href'], :year => volume.parent.parent['id'].split("pi-")[1].strip}
            volumes << hash
         end
         volumes = volumes.sort_by { |hsh| hsh[:year] }
         volumes = volumes.reverse         
         puts volumes         
         puts volumes.size
   end
 


 
end