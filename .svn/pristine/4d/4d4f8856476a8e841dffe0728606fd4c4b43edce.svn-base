require 'rubygems'

=begin
Site.all.each do |element|
  if element.scraping_status != nil && element.scraping_status.automatically_tagged == true && element.scraping_status.categorized != true
    puts "Categorize site: "+element.id.to_s
    automatic_tags=TaggableTagAnnotation.where(:taggable_id => element.id, :taggable_type => "Site", :type_tag => "automatic")
    automatic_tags_ids=automatic_tags.map {|t| t.wikipedia_article_id}
    element.categorize(automatic_tags_ids)       
  end
end
=end
=begin
Documentary.all.each do |element|
  if element.scraping_status != nil && element.scraping_status.automatically_tagged == true && element.scraping_status.categorized != true
    puts "Categorize documentary: "+element.id.to_s
    automatic_tags=TaggableTagAnnotation.where(:taggable_id => element.id, :taggable_type => "Documentary", :type_tag => "automatic")
    automatic_tags_ids=automatic_tags.map {|t| t.wikipedia_article_id}
    element.categorize(automatic_tags_ids)       
  end
end
=end


Documentary.last(2526).each do |element|
  if element.scraping_status != nil && element.scraping_status.automatically_tagged == true
    puts "Categorize documentary: "+element.id.to_s
    automatic_tags=TaggableTagAnnotation.where(:taggable_id => element.id, :taggable_type => "Documentary", :type_tag => "automatic")
    automatic_tags_ids=automatic_tags.map {|t| t.wikipedia_article_id}
    element.categorize(automatic_tags_ids)       
  end
end

=begin
Lecture.all.each do |element|
  if element.scraping_status != nil && element.scraping_status.automatically_tagged == true && element.scraping_status.categorized != true
    puts "Categorize lecture: "+element.id.to_s
    automatic_tags=TaggableTagAnnotation.where(:taggable_id => element.id, :taggable_type => "Lecture", :type_tag => "automatic")
    automatic_tags_ids=automatic_tags.map {|t| t.wikipedia_article_id}
    element.categorize(automatic_tags_ids)       
  end
end
=end

=begin
Event.all.each do |element|
  if element.scraping_status != nil && element.scraping_status.automatically_tagged == true && element.scraping_status.categorized != true
    puts "Categorize event: "+element.id.to_s
    automatic_tags=TaggableTagAnnotation.where(:taggable_id => element.id, :taggable_type => "Event", :type_tag => "automatic")
    automatic_tags_ids=automatic_tags.map {|t| t.wikipedia_article_id}
    element.categorize(automatic_tags_ids)       
  end
end
=end