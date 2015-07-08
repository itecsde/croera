class Harvester
  include ActionView::Helpers::SanitizeHelper
  
  def harvest_applications()
    url = 'http://composer.itec.km.co.at/composer/applications/harvest'
    #url = 'http://itec-composer.eun.org/composer/applications/harvest'
    result = RestClient::Request.execute(:method => :get, :url => url, :timeout => 90000000)
    
    parsed_result = JSON.parse result
    
    parsed_result.each { |item|
      ##Filtramos duplicados
      puts "Vemos si duplicado"
      if Application.where(:itec_id=> "#{item['id']}").size==0
          puts "No duplicado lo meto" 
          application = Application.new
          application.name = "#{item['entry']['name']}"
          description = "#{item['entry']['description']}"
          application.description = strip_tags description
          application.itec_id="#{item['id']}"
          
          puts "------------------------------------"
          puts item['entry']['image']
          
          begin
            URI.parse(item['entry']['image'].to_s)
            if item['entry']['image'] != ""
              application.element_image = URI.parse(item['entry']['image'].to_s)
            end
          rescue
          end
          
          item['entry']['functionalities'].each do |parsed_functionality|
            parsed_functionality_name = parsed_functionality['functionalityID']
            functionality_found = Functionality.find_by_name(parsed_functionality_name.downcase!)
            if functionality_found != nil
              application.save!
              annotation = ApplicationFunctionalityAnnotation.new
              annotation.application = application
              annotation.functionality_id = functionality_found.id
              annotation.level = parsed_functionality['functionalityLevel']
              annotation.save!
            end  
          end
          application.save
      end
    }
  end
  
  
  def harvest_people()
    filename = "./harvest/person.json"
    parsed_result = JSON.parse( IO.read(filename) )
    
    persons = parsed_result['entries']
    persons.each do |person|
      name = person['name']
      descripcion = person['description']
      
      text = ''
      if descripcion.size > 0
        text = strip_tags(descripcion[0]['text'].to_s)
      end
      puts text
      #texto = descripcion['text']
      #descripcion = descripcion['text']
      itec_id = person['_id']
      if Person.where(:itec_id=> itec_id).size==0
        persona = Person.new
        persona.name=name
        persona.description=text          
        persona.itec_id = itec_id.to_s
        persona.save()
      end
    end
    puts 'FIN'
  end
  
  def harvest_events()
    filename = "./harvest/events.json"
    parsed_result = JSON.parse( IO.read(filename) )
    
    events = parsed_result['entries']
    events.each do |event|
      arr_name = event['name']
      name = ''
      if arr_name.size > 0
        name = arr_name[0]['text'].to_s
      end
      descripcion = event['description']
      text = ''
      if descripcion.size > 0
        text = strip_tags(descripcion[0]['text'].to_s)
      end
      itec_id = event['_id']
      if Event.where(:itec_id=> itec_id).size==0
        scraped_event=Event.new
        scraped_event.name=name
        scraped_event.description=text
                  
        scraped_event.itec_id = itec_id.to_s
        scraped_event.save()
      end
    end
    puts 'FIN'
  end
  
end