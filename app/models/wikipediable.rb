module Wikipediable
  def self.included(base)
    base.class_eval do
      def annotate
        begin 
          puts "Proceeding to wikipediate event"
          tags = []
          if self.description != nil && self.description != ""
            begin
              url = "http://192.168.1.98:8080/wikipediaminer/services/wikify?source=" + URI::encode(self.description.gsub(/[^a-z,A-Z,0-9,\s]+/,""))
              page = Nokogiri::XML(open(url, :read_timeout => 10))
              tags = page.xpath("//message/detectedTopics/detectedTopic")
              tags.each do |tag|
                if tag['weight'].to_f > 0.1
                  tag = tag['title']
                  if Tag.find_by_name(tag)!=nil
                    puts "Proceeding to associate Wikipedia tag"
                    self.tags << Tag.find_by_name(tag)
                  else
                    puts "Proceeding to create new Wikipedia tag"
                    puts tag['title']
                    new_tag=Tag.new
                    new_tag.name=tag
                    new_tag.save
                    self.tags << new_tag
                  end
                end
              end
            rescue Exception => e
              puts "Error while wikipediating event"
            end
          end
          
          puts "Wikipediate 1"
          
          if (tags.size > 0)
          
            itec_categories = {"art" => "752", "astronomy" => "50650", "biology" => "9127632", "chemistry" => "5180", "citizenship" => "6784", "classical languages" => "710704", "culture" => "19159508", "economics" => "9223", "environmental education" => "2538735", "ethics" => "9258", "European studies" => "1698091", "foreign language" => "1094802", "geography" => "18963910", "geology" => "12207", "health education" => "80381", "history" => "10772350", "home economics" => "23537784", "informatics/ICT" => "23997160", "language and literature" => "18963870", "law" => "18949668", "mathematics" => "18831", "media education" => "240072", "music" => "18839", "natural sciences" => "38890", "philosophy" => "13682155", "physical education" => "217324", "physics" => "22939", "politics" => "22986", "pre-school education" => "432881", "primary education" => "11722032", "psychology" => "22921", "religion" => "25414", "social sciences" => "26781", "special (needs) education" => "436831", "technology" => "29816"}
            final_weights = Hash.new(0.0)
            # For each tag
            tags.each do |tag|
              ids1 = tag['id']
              #puts "Wikipediate 2"
              
              url_compare = "http://192.168.1.98:8080/wikipediaminer/services/compare?ids1=" + ids1 + "&ids2=752,50650,9127632,5180,6784,710704,19159508,9223,2538735,9258,1698091,1094802,18963910,12207,80381,10772350,23537784,23997160,18963870,18949668,18831,240072,18839,38890,13682155,217324,22939,22986,432881,11722032,22921,25414,26781,436831,29816"
              page_compare = Nokogiri::XML(open(url_compare))
              comparisons = page_compare.xpath("//message/comparisons/comparison")          
              # For each comparison
              comparisons.each do |comparison|
                #puts "Comparison:"
                #puts comparison['relatedness']            
                total_relatedness = comparison['relatedness'].to_f*tag['weight'].to_f
                
                low_id = comparison['lowId']
                high_id = comparison['highId']
                if itec_categories.key(low_id) != nil
                  key = itec_categories.key(low_id)
                else
                  key = itec_categories.key(high_id)  
                end
                
                final_weights[key] = final_weights[key] + total_relatedness            
              end          
            end  
            
            # Assigns the subjects
            ordered_final_weights = final_weights.sort_by {|k, v| v}.reverse
            # Divides the weights by the number of tags
            #ordered_final_weights.each do |key, value|
            #  ordered_final_weights[key] = ordered_final_weights[key]/tags.size
            #end
                      
            ordered_final_weights.first(3).each do |key, value|
              if value > 0.0
                event_subject_annotation = EventSubjectAnnotation.new
                subject = Subject.find_by_name(key)
                event_subject_annotation.subject = subject
                event_subject_annotation.event = self 
                event_subject_annotation.weight = value
                
                self.event_subject_annotations << event_subject_annotations
                puts "Assigned Subject: "
                puts subject.name
                puts "_____"
              end
            end
                  
            final_weights.each do |key, value|
              #puts "Final weight for: " + key
              puts value
            end
          
          end  
        end
  
  
      
      rescue
      end
    end
  end
end