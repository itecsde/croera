# encoding: utf-8
require 'net/http'
require 'net/https'
require 'uri'

class RecordLinkage
   include ActionView::Helpers::SanitizeHelper
   def record_linkage_maximum_method(id1,id2)
      begin
         wikipediator = Wikipediator.new
         wikitopics_A = Array.new
         wikitopics_B = Array.new
         max_relatedness = 0.0
         total_relatedness = 0.0
         report_A = Report.where(:id => id1)[0]
         report_B = Report.where(:id => id2)[0]
         puts "Report A"
         report_A.taggable_tag_annotations.each do |wikitopic|
            wikitopics_A << {:name =>wikitopic.tag.name, :weight => wikitopic.weight, :wikipedia_article_id => wikitopic.wikipedia_article_id}
         end
         puts "Report B"
         report_B.taggable_tag_annotations.each do |wikitopic|
            wikitopics_B << {:name =>wikitopic.tag.name, :weight => wikitopic.weight, :wikipedia_article_id => wikitopic.wikipedia_article_id}
         end
              
         puts "Wikitopics Report_A"
         puts 
         puts wikitopics_A
         puts "Wikitopics Report_B"
         puts
         puts wikitopics_B
 

         
         wikitopics_A.each do |wikitopic_A|
            array_relatedness = Array.new
            max_relatedness = 0.0         
            wikitopics_B.each do |wikitopic_B|
               #puts "comparing..."
               #puts wikitopic_A
               #puts "with"
               ##puts wikitopic_B
               relatedness = (wikipediator.compare(wikitopic_A[:wikipedia_article_id],wikitopic_B[:wikipedia_article_id]))
               #puts "Relatedness: " + relatedness.to_s
               array_relatedness << relatedness
            end
            #puts array_relatedness
            max_relatedness = array_relatedness.max.to_f
            #puts "Max: " +  max_relatedness.to_s
            total_relatedness = total_relatedness + max_relatedness
         end
         record_linkage_value = total_relatedness / wikitopics_A.size.to_f
         #puts total_relatedness
         #puts wikitopics_A.size.to_f
         puts "Record linkage value: " + record_linkage_value.to_s
         if record_linkage_value > 0.1
            #File.open(id1.to_s + "vs" + id2.to_s + '_maximum_method.txt', 'w') do |f2|
            File.open('record_linkage_maximum_method.txt', 'a') do |f2|            
               f2.puts "Report_A"
               f2.puts "id: " + report_A.id.to_s
               f2.puts
               f2.puts "Name: " + report_A.name
               f2.puts "Section: " + report_A.section.to_s
               f2.puts 
               f2.puts wikitopics_A
               f2.puts
               f2.puts "Report_B"
               f2.puts "id: " + report_B.id.to_s
               f2.puts         
               f2.puts "Name: " + report_B.name
               f2.puts "Section: " + report_B.section.to_s
               f2.puts
               f2.puts wikitopics_B
               f2.puts 
               f2.puts "Record linkage value: " + record_linkage_value.to_s
            end #file
         end
      rescue Exception => e
         puts "Exception record_linkage_maximum_method"
         puts e.message
         puts e.backtrace.inspect
      end
   end
   
   def record_linkage_mean_method(id1,id2)
      begin
         wikipediator = Wikipediator.new
         wikitopics_A = Array.new
         wikitopics_B = Array.new
         total_relatedness = 0.0
         total_mean_relatedness = 0.0
         report_A = Report.where(:id => id1)[0]
         report_B = Report.where(:id => id2)[0]
         puts "Report A"
         report_A.taggable_tag_annotations.each do |wikitopic|
            wikitopics_A << {:name =>wikitopic.tag.name, :weight => wikitopic.weight, :wikipedia_article_id => wikitopic.wikipedia_article_id}
         end
         puts "Report B"
         report_B.taggable_tag_annotations.each do |wikitopic|
            wikitopics_B << {:name =>wikitopic.tag.name, :weight => wikitopic.weight, :wikipedia_article_id => wikitopic.wikipedia_article_id}
         end        
         puts "Wikitopics Report_A"
         puts 
         puts wikitopics_A
         puts "Wikitopics Report_B"
         puts
         puts wikitopics_B       
         
         wikitopics_A.each do |wikitopic_A|
            array_relatedness = Array.new      
            total_relatedness = 0.0
            wikitopics_B.each do |wikitopic_B|
               puts "comparing..."
               puts wikitopic_A
               puts "with"
               puts wikitopic_B
               relatedness = (wikipediator.compare(wikitopic_A[:wikipedia_article_id],wikitopic_B[:wikipedia_article_id]))
               puts "Relatedness: " + relatedness.to_s
               total_relatedness = total_relatedness.to_f + relatedness.to_f
               puts "total relatedness: " + total_relatedness.to_s
            end
            mean_relatedness = total_relatedness / wikitopics_B.size.to_f
            puts "Mean relatedness: " + mean_relatedness.to_s
            total_mean_relatedness = total_mean_relatedness +  mean_relatedness
            puts "Total mean relatedness: " + total_mean_relatedness.to_s            
         end
         record_linkage_value = total_mean_relatedness / wikitopics_A.size.to_f
         puts total_relatedness
         puts "Record linkage value: " + record_linkage_value.to_s
         if record_linkage_value > 0.1
            #File.open(id1.to_s + "vs" + id2.to_s + '_mean_method.txt', 'w') do |f2|
            File.open('record_linkage_mean_method.txt', 'a') do |f2|          
               f2.puts "Report_A"
               f2.puts "id: " + report_A.id.to_s
               f2.puts
               f2.puts "Name: " + report_A.name
               f2.puts "Section: " + report_A.section.to_s
               f2.puts 
               f2.puts wikitopics_A
               f2.puts
               f2.puts "Report_B"
               f2.puts "id: " + report_B.id.to_s
               f2.puts         
               f2.puts "Name: " + report_B.name
               f2.puts "Section: " + report_B.section.to_s
               f2.puts
               f2.puts wikitopics_B
               f2.puts 
               f2.puts "Record linkage value: " + record_linkage_value.to_s
            end #file
         end
      rescue Exception => e
         puts "Exception record_linkage_mean_method"
         puts e.message
         puts e.backtrace.inspect
      end
   end   
   
   def record_linkage
      begin
         Report.all.each do |reportA|
            sleep 1
            Report.all.each do |reportB|
               sleep 1
               record_linkage_maximum_method(reportA.id,reportB.id)
               record_linkage_mean_method(reportA.id,reportB.id) 
            end
         end
      rescue Exception => e
         puts "Exception record_linkage"
         puts e.message
         puts e.backtrace.inspect
      end
   end
   
   
   
   
end