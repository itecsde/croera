class SdeIntegrator
  include ActionView::Helpers::SanitizeHelper
  def populate_functionalities() 
    result_en = RestClient.get 'http://itec.det.uvigo.es/itec-sde-javi/wservices/resources/en/vocabularies/functionalities'
    result_gl = RestClient.get 'http://itec.det.uvigo.es/itec-sde-javi/wservices/resources/gl/vocabularies/functionalities'
    result_es = RestClient.get 'http://itec.det.uvigo.es/itec-sde-javi/wservices/resources/es/vocabularies/functionalities'
    
    parsed_result_en = JSON.parse result_en
    parsed_result_gl = JSON.parse result_gl
    parsed_result_es = JSON.parse result_es
    
    parsed_result_en.each_with_index { |item, index|
      I18n.locale = "en"
      functionality= Functionality.create(name: "#{item['name']}", sde_id: "#{item['id']}")
      I18n.locale = "gl"
      item_gl = parsed_result_gl[index]
      functionality.name = item_gl['name']
      functionality.save
      I18n.locale = "es"
      item_es = parsed_result_es[index]
      functionality.name = item_es['name']
      functionality.save
    }
  end
  
  def populate_applications()
    result = RestClient.get 'http://itec.det.uvigo.es/itec-sde-javi/wservices/resources/es/tools/applications'
    
    parsed_result = JSON.parse result
    
    parsed_result.each { |item|

    application = Application.create(name: "#{item['name']}", 
                    description: "#{item['description']}",
                    itec_id: "#{item['id']}",
                    ld_id: "#{item['id_ld']}",
                    external: "#{item['external']}")
                
    application.description = strip_tags application.description
    application.save    
    }
    puts parsed_result  
  end
  
  def populate_devices()
    result = RestClient.get 'http://itec.det.uvigo.es/itec-sde-javi/wservices/resources/es/tools/devices'
    
    parsed_result = JSON.parse result
    
    parsed_result.each { |item|
      device= Device.create(name: "#{item['name']}", 
                description: "#{item['description']}",
                itec_id: "#{item['id']}",
                ld_id: "#{item['id_ld']}",
                external: "#{item['external']}")
            
     device.description = strip_tags device.description
    device.save
    }
    puts parsed_result  
  end
  
  def populate_person_categories()
    result = RestClient.get 'http://itec.det.uvigo.es/itec-sde-javi/wservices/resources/en/vocabularies/person_categories'
    
    parsed_result = JSON.parse result
    
    parsed_result.each { |item|
      puts "#{item}\n"
      PersonCategory.create(name: "#{item['name']}", 
        description: "#{item['description']}")
    }
    
    puts parsed_result      
  end
  
  def populate_person_roles()
    result = RestClient.get 'http://itec.det.uvigo.es/itec-sde-javi/wservices/resources/en/vocabularies/person_roles'
    
    parsed_result = JSON.parse result
    
    parsed_result.each { |item|
      puts "#{item}\n"
      PersonRole.create(name: "#{item['name']}", 
        description: "#{item['description']}")
    }
    
    puts parsed_result          
  end
  
  def populate_event_places()
    result = RestClient.get 'http://itec.det.uvigo.es/itec-sde-javi/wservices/resources/en/vocabularies/event_places'
    
    parsed_result = JSON.parse result
    
    parsed_result.each { |item|
      puts "#{item}\n"
      EventPlace.create(name: "#{item['name']}", 
        description: "#{item['description']}")
    }
    
    puts parsed_result          
  end
  
  def populate_event_types()
    result = RestClient.get 'http://itec.det.uvigo.es/itec-sde-javi/wservices/resources/en/vocabularies/event_types'
    
    parsed_result = JSON.parse result
    
    parsed_result.each { |item|
      puts "#{item}\n"
      EventType.create(name: "#{item['name']}", 
        description: "#{item['description']}")
    }
    
    puts parsed_result      
  end
  
  def populate_people()
    result = RestClient.get 'http://itec.det.uvigo.es/itec-sde-javi/wservices/resources/en/people'
    
    parsed_result = JSON.parse result
    
    parsed_result.each { |item|
      puts "#{item}\n"
      Person.create(name: "#{item['name']}", 
        description: "#{item['description']}",
       itec_id: "#{item['id']}",
        ld_id: "#{item['id_ld']}")
    }
    
    puts parsed_result  
  end
  
  def populate_events()
    result = RestClient.get 'http://itec.det.uvigo.es/itec-sde-javi/wservices/resources/en/events'
    
    parsed_result = JSON.parse result
    
    parsed_result.each { |item|
      puts "#{item}\n"
      Event.create(name: "#{item['name']}", 
        description: "#{item['description']}",
       itec_id: "#{item['id']}",
        ld_id: "#{item['id_ld']}")
    }
    
    puts parsed_result  
  end
  
  def populate_subjects()
    result_en = RestClient.get 'http://itec.det.uvigo.es/itec-sde-javi/wservices/resources/en/vocabularies/knowledge_areas'
    result_gl = RestClient.get 'http://itec.det.uvigo.es/itec-sde-javi/wservices/resources/gl/vocabularies/knowledge_areas'
    result_es = RestClient.get 'http://itec.det.uvigo.es/itec-sde-javi/wservices/resources/es/vocabularies/knowledge_areas'
    
    parsed_result_en = JSON.parse result_en
    parsed_result_gl = JSON.parse result_gl
    parsed_result_es = JSON.parse result_es
    
    parsed_result_en.each_with_index { |item, index|
      I18n.locale = "en"
      subject= Subject.create(name: "#{item['name']}", sde_id: "#{item['id']}")
      I18n.locale = "gl"
      item_gl = parsed_result_gl[index]
      subject.name = item_gl['name']
      subject.save
      I18n.locale = "es"
      item_es = parsed_result_es[index]
      subject.name = item_es['name']
      subject.save
    }
       
  end
  
  def populate_education_levels()
    result_en = RestClient.get 'http://itec.det.uvigo.es/itec-sde-javi/wservices/resources/en/vocabularies/education_levels'
    result_gl = RestClient.get 'http://itec.det.uvigo.es/itec-sde-javi/wservices/resources/es/vocabularies/education_levels'
    result_es = RestClient.get 'http://itec.det.uvigo.es/itec-sde-javi/wservices/resources/es/vocabularies/education_levels'
    
    parsed_result_en = JSON.parse result_en
    parsed_result_gl = JSON.parse result_gl
    parsed_result_es = JSON.parse result_es
    
    parsed_result_en.each_with_index { |item, index|
      I18n.locale = "en"
      education_level= EducationLevel.create(name: "#{item['name']}", sde_id: "#{item['id']}")
      I18n.locale = "gl"
      item_gl = parsed_result_gl[index]
      education_level.name = item_gl['name']
      education_level.save
      I18n.locale = "es"
      item_es = parsed_result_es[index]
      education_level.name = item_es['name']
      education_level.save
    }
       
  end
  
  def populate_contextual_languages()
    result_en = RestClient.get 'http://itec.det.uvigo.es/itec-sde-javi/wservices/resources/en/vocabularies/languages'
    result_gl = RestClient.get 'http://itec.det.uvigo.es/itec-sde-javi/wservices/resources/es/vocabularies/languages'
    result_es = RestClient.get 'http://itec.det.uvigo.es/itec-sde-javi/wservices/resources/es/vocabularies/languages'
    
    parsed_result_en = JSON.parse result_en
    parsed_result_gl = JSON.parse result_gl
    parsed_result_es = JSON.parse result_es
    
    parsed_result_en.each_with_index { |item, index|
      I18n.locale = "en"
      language= ContextualLanguage.create(name: "#{item['name']}", sde_id: "#{item['id']}")
      I18n.locale = "gl"
      item_gl = parsed_result_gl[index]
      language.name = item_gl['name']
      language.save
      I18n.locale = "es"
      item_es = parsed_result_es[index]
      language.name = item_es['name']
      language.save
    }   
  end
  
    def populate_languages()
    result_en = RestClient.get 'http://itec.det.uvigo.es/itec-sde-javi/wservices/resources/en/vocabularies/languages'
    result_gl = RestClient.get 'http://itec.det.uvigo.es/itec-sde-javi/wservices/resources/es/vocabularies/languages'
    result_es = RestClient.get 'http://itec.det.uvigo.es/itec-sde-javi/wservices/resources/es/vocabularies/languages'
    
    parsed_result_en = JSON.parse result_en
    parsed_result_gl = JSON.parse result_gl
    parsed_result_es = JSON.parse result_es
    
    parsed_result_en.each_with_index { |item, index|
      I18n.locale = "en"
      language = Language.create(language: "#{item['name']}")
    }   
  end
   
  def recommend_tools(request, sde_url)
      result = RestClient.post sde_url, request, :content_type => :json, :accept => :json
      @recommended_tools ||= Array.new
      case result.code
       when 200
         puts "REQUEST"
         puts request
         puts "Codigo"
         puts result.code
         parsed_result = JSON.parse result
         puts "RESOURCES"
         puts parsed_result['result']
         puts "ERROR"
         puts parsed_result['error'] 
          if parsed_result['error'] == nil
              parsed_result['result']['resources'].each{|resource|
                resource['recommended_resources'].each{|recommended_resource|
                  @tool=Application.all(:conditions => {:ld_id => recommended_resource })
                  if (@tool.length == 0)
                    @tool=Device.all(:conditions => {:ld_id => recommended_resource })
                  end
                  if (@tool.length == 0)
                    @tool=Application.all(:conditions => {:itec_id => recommended_resource })
                  end
                  if (@tool.length == 0)
                    @tool=Device.all(:conditions => {:itec_id => recommended_resource })
                  end
                  if (@tool.length != 0)
                    @recommended_tools.push(@tool.first)
                  end
                }
                
              }    
          end 
          return @recommended_tools
       
        else
          puts "Hubo error"
            puts result.code
          return @recommended_tools
        end
      
     
  end
  
  def recommend_people(request, sde_url)
      result = RestClient.post sde_url, request, :content_type => :json, :accept => :json
      @recommended_people ||= Array.new
      case result.code
       when 200
          puts request
          parsed_result = JSON.parse result
          puts "RESOURCES"
          puts parsed_result['result']
         if parsed_result['error'] == nil
              parsed_result['result']['resources'].each{|resource|
                resource['recommended_resources'].each{|recommended_resource|
                  @person=Person.all(:conditions => {:ld_id => recommended_resource })
                  if (@person.length == 0)
                    @person=Person.all(:conditions => {:ld_id => recommended_resource })
                  end
                  if (@person.length == 0)
                    @person=Person.all(:conditions => {:itec_id => recommended_resource })
                  end
                  if (@person.length == 0)
                    @person=Person.all(:conditions => {:itec_id => recommended_resource })
                  end
                  if (@person.length != 0)
                    @recommended_people.push(@person.first)
                  end
                }
                
              }    
          end 
          return @recommended_people
       
        else
          puts "Hubo error"
            puts result.code
          return @recommended_people
        end
      
      
     
  end
  
  def recommend_events(request, sde_url)
    result = RestClient.post sde_url, request, :content_type => :json, :accept => :json
      @recommended_events ||= Array.new
      case result.code
       when 200
          puts request
          parsed_result = JSON.parse result
          puts "RESOURCES"
          puts parsed_result['result']
         if parsed_result['error'] == nil
              parsed_result['result']['resources'].each{|resource|
                resource['recommended_resources'].each{|recommended_resource|
                  @event=Event.all(:conditions => {:ld_id => recommended_resource })
                  if (@event.length == 0)
                    @event=Event.all(:conditions => {:ld_id => recommended_resource })
                  end
                  if (@event.length == 0)
                    @event=Event.all(:conditions => {:itec_id => recommended_resource })
                  end
                  if (@event.length == 0)
                    @event=Event.all(:conditions => {:itec_id => recommended_resource })
                  end
                  if (@event.length != 0)
                    @recommended_events.push(@event.first)
                  end
                }
                
              }    
          end 
          return @recommended_events
       
        else
          puts "Hubo error"
            puts result.code
          return @recommended_events
        end
     
  end
end