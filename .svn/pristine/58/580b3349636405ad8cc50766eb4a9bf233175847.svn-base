# encoding: utf-8

require "nokogiri"
require "open-uri"

class CreatorCorpusReuters
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

end