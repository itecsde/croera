require 'rubygems'
require 'nokogiri'
require 'open-uri'

wikipediator = Wikipediator.new

Lecture.find_each do |lecture|
  
  puts "Lecture --> " + lecture.name
  if lecture.name == nil
    lecture.name=""
  end
  if lecture.description == nil
    lecture.description=""
  end
  
  tags = wikipediator.wikify(lecture.name + ". " + lecture.description)
  if tags != nil
      tags.each do |tag|          
        if Tag.find_by_name(tag['title'])!=nil
          #puts "ya existe tag lo asocio"
          new_annotation = TaggableTagAnnotation.new
          new_annotation.taggable = lecture
          new_annotation.tag = Tag.find_by_name(tag['title'])
          new_annotation.type = "automatic"
          new_annotation.weight=tag['weight']
          new_annotation.save          
          #lecture.tags << Tag.find_by_name(tag['title'])
        else
          #puts "No existe tag, lo creo"
          new_tag=Tag.new
          new_tag.name=tag['title']
          new_tag.save
          new_annotation = TaggableTagAnnotation.new
          new_annotation.taggable = lecture
          new_annotation.tag = new_tag
          new_annotation.type = "automatic"
          new_annotation.weight=tag['weight']
          new_annotation.save
          Sunspot.index new_tag                    
          Sunspot.commit
          #lecture.tags << new_tag
        end         
      end #do |tag|  
      lecture.save
   end    
end

       