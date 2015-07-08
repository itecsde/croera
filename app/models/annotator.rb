require 'thread'

class Annotator
   def initialize wikipediator_ip
      @wikipediator_ip = wikipediator_ip
      @state = "running"
   end

   def run
      Thread.new do
            Broker.instance.say "Annotator #{@wikipediator_ip}.run checkpoint 1"
            @queue = Broker.instance.queue
            Broker.instance.say "Annotator.run checkpoint 2"
            classify = Classify.new
            loop do
               begin
                  if @state == "running"
                     task = @queue.pop
                     Broker.instance.say "Consumed a task named #{task.method.to_s} from queue with #{@queue.size} elements..."
                     resource = task.element
                     
                     case task.method.to_s
                     when "classify"
                        sections = ["Business", "Technology", "Science", "Health", "Sport", "Art", "Politics", "Economy"]
                        if resource.section == nil                       
                           classify.classify_report(resource, "basic", sections, false, 0, @wikipediator_ip)
                           puts "Resource classified"                              
                        end  
                     when "obtain_centroid_based_weight"
                        if resource.taggable_tag_annotations.where(:type_tag=>"automatic",:centroid_based_weight => nil).size > 0
                           classify.obtain_centroid_based_weight(resource,@wikipediator_ip)
                           puts "Obtained Centroid Based Weight"   
                        else
                           puts "Resource already centered"
                        end
                     when "concept_language_correspondence"
                        if resource.taggable_tag_annotations.where(:type_tag=>"automatic").size > 0
                           classify.document_language_concept_correspondence(resource, "es","en")
                           puts "Obtained document concept_language_correspondence"   
                        end    
                     when "expand_concepts"
                        #resource.store_expanded_wikitopics(resource,10,10)
                        resource.store_expanded_wikitopics(resource, 0.7, 0.7)
			               puts "Resource Expanded"                                           
                     else                                             
                        puts "Proceding to annotate resource: "+ resource.class.to_s + " " + resource.id.to_s
                        # Gets its manual tags
                        manual_tags = Array.new
                        resource.taggable_tag_annotations.where(:type_tag => "human").each do |annotation|
                           manual_tags << annotation.tag.name
                        end
                        if resource.respond_to?('author') && resource.author != nil && resource.author != ""
                           manual_tags << resource.author
                        end      
                        # Deletes previous semantic annotations
                        resource.taggable_tag_annotations.where(:type_tag => ["automatic", "automatic_from_human"]).each do |annotation|
                           annotation.destroy
                        end
         
                        # Annotates the resource again
                        if resource.info_to_wikify == nil
                           resource.info_to_wikify = resource.description
                        end
                        #resource.extract_wikitopics(resource.name, resource.info_to_wikify, manual_tags, @wikipediator_ip) #asi está en el server
                        resource.extract_wikitopics_only_from_title_and_description(resource.name, resource.info_to_wikify, @wikipediator_ip)
                        puts "Resource annotated successfully"
                     end
                  else
                     sleep 5
                  end   
               rescue Exception => e
                  Broker.instance.say e.message
                  Broker.instance.say e.backtrace.inspect
                  Broker.instance.say "Exception in Annotator.run #{@wikipediator_ip}"
               end                 
            end
      end
      Thread.new do 
         loop do
            begin
               sleep 5
               #url = "http://" + @wikipediator_ip + ":8080/wikipediaminer/services/wikify?source="+"Spain"
               url = "http://" + @wikipediator_ip + "/wikipediaminer/services/wikify?source="+"nikola"
               page = Nokogiri::XML(open(url))
               tags = page.xpath("//message/detectedTopics/detectedTopic")
               if tags != nil && tags.size > 0
                  @state = "running"
               else
                  Broker.instance.say "Wikipediator #{@wikipediator_ip} is DOWN without exception!"
                  @state = "down"
               end               
            rescue Exception => e
               Broker.instance.say e.message
               Broker.instance.say e.backtrace.inspect
               @state = "down"
               Broker.instance.say "Wikipediator #{@wikipediator_ip} is DOWN!"
            end
         end
      end
   end
end
