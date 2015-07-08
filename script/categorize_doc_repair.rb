require 'rubygems'

id=0;
Documentary.last(3000).each do |element|
  
  puts "Documentary id: "+element.id.to_s
  if element.scraping_status.categorized == true
    if element.categories!= nil
      puts "Categorized: "+element.categories.size.to_s
      if element.categories.size > 0
        id=element.id
      end
    else
       puts "Categorized: nil"
    end
  else 
    puts "Not Categorized"
  end 
=begin  
  if element.scraping_status != nil && element.scraping_status.automatically_tagged == true && element.scraping_status.categorized != true
    puts "Categorize documentary: "+element.id.to_s
    automatic_tags=TaggableTagAnnotation.where(:taggable_id => element.id, :taggable_type => "Documentary", :type_tag => "automatic")
    automatic_tags_ids=automatic_tags.map {|t| t.wikipedia_article_id}
    element.categorize(automatic_tags_ids)       
  end
=end
end
puts "Last id= "+id.to_s