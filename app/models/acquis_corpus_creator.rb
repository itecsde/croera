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

class AcquisCorpusCreator
   include ActionView::Helpers::SanitizeHelper
   
   def create_eurovoc_thesaurus
      begin
         eurovoc_domains = Array.new
         eurovoc_domains_url = "http://eurovoc.europa.eu/drupal/?q=navigation&cl=en"
         eurovoc_domains_nokogiri_page = Nokogiri::HTML(open(eurovoc_domains_url))
         
         helper_root_node = Eurovoc.new
         
         helper_root_node.add_root_helper_node("helper_root_node","root_helper",nil,0)
         
         eurovoc_domains_nokogiri_page.css("ul#navigationPageUl li span").each do |eurovoc_domain|
            domain = eurovoc_domain.text
            eurovoc_domain_id = domain.scan(/\d+|\D+/)[0]
            domain_name = domain.scan(/\d+|\D+/)[1].strip
            new_eurovoc_node = Eurovoc.new
            
            new_eurovoc_node.add_node(domain_name,"domain",0,eurovoc_domain_id)
                  
            hash_domain_id_domain_name = {:id => eurovoc_domain_id, :name => domain_name}
            eurovoc_domains << hash_domain_id_domain_name
            
            eurovoc_domains_nokogiri_page.css("ul#navigationPageUl li ul li").each do |eurovoc_mt|
               parent = eurovoc_mt.parent     
               parent_previous = parent.previous
               if parent_previous.text == eurovoc_domain_id + " " + domain_name
                  mt = eurovoc_mt.text
                  puts mt
                  mt_id = mt.scan(/\d+|\D+/)[0]
                  mt_name = mt.scan(/\d+|\D+/)[1].strip
                  new_eurovoc_node = Eurovoc.new
                  
                  new_eurovoc_node.add_node(mt_name,"MT",eurovoc_domain_id,mt_id)
                  
                  mt_url = eurovoc_mt.css("a")[0]['href'].split("http")[1]
                  mt_url = "http" + mt_url       
                  obtain_eurovoc_nodes_from_micro_thesaurus mt_url, mt_id          
               end
            end
            #puts "Estoy esperando"
            #sleep 100000000000000                 
         end         
         puts eurovoc_domains
      rescue Exception => e
         puts "Exception create_eurovoc_thesaurus"
         puts e.message
         puts e.backtrace.inspect
      end
   end
   
   def obtain_eurovoc_nodes_from_micro_thesaurus(mt_url, mt_id)
      begin
         mt_nokogiri_page = Nokogiri::HTML(open(mt_url))
         mt_nokogiri_page.css("div.mtContainer div.tt").each do |tt|
            top_term = tt.css("a.tooltip")[0].text.strip
            puts
            puts
            puts top_term
            tt_aux = tt
            tt_name = top_term
            tt_url = tt.css("a.tooltip")[0]['href'].split("http")[1]
            tt_url = "http" + tt_url
            eurovoc_code = obtain_eurovoc_code tt_url, "TT"            
            tt_code = eurovoc_code
            tt_parent_id = mt_id
            new_eurovoc_node = Eurovoc.new
            new_eurovoc_node.add_node(tt_name, "TT",mt_id,tt_code)
                     
            while tt_aux.next_element['class'] != "tt"
               if tt_aux.next_element['class'] == "nt1" or tt_aux.next_element['class'] == "nt2" 
                  name = tt_aux.next_element.css("a")[0].text.strip
                  type_node = tt_aux.next_element.css("label.tooltip")[0].text    
                  nt_url = tt_aux.next_element.css("a")[0]['href'].split("http")[1]
                  nt_url = "http" + nt_url
                  eurovoc_code = obtain_eurovoc_code nt_url, type_node.downcase
                  puts type_node + " : " + name + " : " + eurovoc_code.to_s
                  if type_node.downcase == "nt1"
                     parent_id_aux = eurovoc_code
                  end
                  if type_node.downcase == "nt1"
                     parent_id = tt_code
                  elsif type_node.downcase == "nt2"
                     parent_id = parent_id_aux
                  end                  
                  new_eurovoc_node = Eurovoc.new
                  new_eurovoc_node.add_node(name,tt_aux.next_element['class'].upcase,parent_id,eurovoc_code.to_i)                 
               end
               tt_aux = tt_aux.next_element
            end           
         end
                 
      rescue Exception => e
         puts "Exception obtain_eurovoc_nodes_from_micro_thesaurus"
         puts e.message
         puts e.backtrace.inspect
      end
   end   
   
   def obtain_eurovoc_code(nt_url, type_node)
      begin
         nt_nokogiri_page = Nokogiri::HTML(open(nt_url))         
         eurovoc_code = nt_nokogiri_page.css("div.termContainer div.termColumn.hierarchy div.concepturi label.tooltip a")[0].text
         eurovoc_code = eurovoc_code.gsub("http://eurovoc.europa.eu/","")
         return eurovoc_code
            
      rescue Exception => e
         puts "Exception obtain_eurovoc_code"
         puts e.message
         puts e.backtrace.inspect
      end
   end      
   
  
   
end