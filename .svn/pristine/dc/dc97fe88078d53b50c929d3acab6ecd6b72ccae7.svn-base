class HarvesterWidgets
  include ActionView::Helpers::SanitizeHelper
  
  def harvest_widgets()
    
    begin
    i=0  
    filename = "./harvest/widgets.json"
    parsed_result = JSON.parse( IO.read(filename) )
    
    widgets = parsed_result['SearchResults']

    widgets.each do |widget|

      ##Filtramos duplicados
      puts "Vemos si duplicado"
         
      if Application.where(:itec_id=> widget['id']).size==0
        puts "No duplicado lo meto" 
        application = Application.new
        
        begin
          application.name = widget['name']
          puts "Name: " + application.name
        rescue
          puts "Failed name harvest_widgets"
        end
               
        begin
          application.description = strip_tags widget['description']
          puts "Description: " + application.description
        rescue
          puts "Failed description harvest_widgets"
        end   
        
        begin
          application.url = widget['uri']
          puts "URL: " + application.url
        rescue
          puts "Failed description harvest_widgets"
        end
            
        application.scraped_from = "http://wookie.eun.org/Store/"
          
          begin           
            tags = Array.new
            
            widget['functionalities'].each do |parsed_functionality|
              tags << parsed_functionality['name']
            end
            widget['tags'].each do |tag|
              tags << tag['tagtext']
            end
            
            puts "Tags: "
            puts tags
            
            tags.each do |tag|
              tag_name = tag
              puts tag_name
              if Tag.find_by_name(tag_name)!=nil
               new_annotation = TaggableTagAnnotation.new
               new_annotation.taggable = application
               new_annotation.tag = Tag.find_by_name(tag_name)
               new_annotation.type_tag = "human"
               new_annotation.save          
             else
               new_tag=Tag.new
               new_tag.name=tag_name
               new_tag.save
               new_annotation = TaggableTagAnnotation.new
               new_annotation.taggable = application
               new_annotation.tag = new_tag
               new_annotation.type_tag = "human"
               new_annotation.save
               Sunspot.index new_tag                    
               Sunspot.commit
             end                 
            end
          rescue
            puts "Failed Tags harvest_widget"
          end
                  
          begin
            URI.parse(widget['icon'].to_s)
            puts "icono_url: " + widget['icon'].to_s
            if widget['icon'].to_s != ""
              application.element_image = URI.parse(widget['icon'].to_s)
            end
          rescue
            puts "Fail icon harvest_widgets"
          end
          application.itec_id = widget['id']
          application.save        
      end
      end
    rescue Exception => e
      puts "Exception in harvest_widgets"
      puts e.message
      puts e.backtrace.inspect
    end
  end
  
end