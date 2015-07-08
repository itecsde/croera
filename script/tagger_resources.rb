require 'rubygems'

puts "TAGGING Documentaries"
Documentary.all.each do |element|
  puts "tagging documentary -> " + element.id.to_s      
  element.refresh_automatic_semantic_annotations
end

puts "TAGGING Courses"
Course.all.each do |element|
  puts "tagging course -> " + element.id.to_s    
  element.refresh_automatic_semantic_annotations
end

puts "TAGGING Lectures"
Lecture.all.each do |element|
  puts "tagging lecture -> " + element.id.to_s
  element.refresh_automatic_semantic_annotations
end

puts "TAGGING Events"
Event.all.each do |element|
  puts "tagging event -> " + element.id.to_s  
  element.refresh_automatic_semantic_annotations
end

=begin
Site.all.each do |element|
  if element.scraping_status != nil #&& element.scraping_status.automatically_tagged == false
    if element.name == nil
      name=""
    else
      name=element.name
    end
    if element.description == nil
      description=""
    else
      description=element.description
    end
    
    element.create_automatic_semantic_annotations(name+" "+description)
  end
  
end

=end