class PublicController < ApplicationController
  def index
     if current_user!=nil
       redirect_to user_root_path
     end
    if 1
       redirect_to "/participants"
    else 
    if ENV['RAILS_ENV'] == "development" 
      if Biography.first != nil         
        counter = Biography.where("element_image_file_size != ?", "").count
        if counter>0  
          @biography=Biography.where("element_image_file_size != ?", "").offset(rand(counter)).first
        else
          @biography=Biography.first(:offset => rand(Biography.count))
        end   
      end
  
      if Event.first != nil    
        counter = Event.where("element_image_file_size != ?", "").count
        if counter>0
          @event=Event.where("element_image_file_size != ?", "").offset(rand(counter)).first
        else
          @event=Event.first(:offset => rand(Event.count)) 
        end
      end
      
      if Application.first != nil     
        counter = Application.where("element_image_file_size != ?", "").count
        if counter>0
          @application=Application.where("element_image_file_size != ?", "").offset(rand(counter)).first
        else
          @application=Application.first(:offset => rand(Application.count)) 
        end
      end
      
      if Lecture.first != nil     
        counter = Lecture.where("element_image_file_size != ?", "").count
        if counter>0
          @lecture=Lecture.where("element_image_file_size != ?", "").offset(rand(counter)).first
        else
          @lecture=Lecture.first(:offset => rand(Lecture.count)) 
        end
      end
    
    
    elsif ENV['RAILS_ENV'] == "production"
       counter = 150
       counter2 = 160     
       if Biography.first != nil         
        begin  
          @biography = Biography.where("element_image_file_size != ?", "").limit(counter2).offset(rand(counter)).first
        rescue
          @biography = nil
        end
        if @biography == nil
          @biography=Biography.first #(:offset => rand(Biography.count))
        end   
      end
  
      if Event.first != nil            
        begin
          @event = Event.where("element_image_file_size != ?", "").limit(counter2).offset(rand(counter)).first
        rescue
          @event = nil
        end
        if @event == nil
          @event=Event.first #(:offset => rand(Event.count)) 
        end
      end
      
      if Application.first != nil     
        begin
          @application = Application.where("element_image_file_size != ?", "").limit(counter2).offset(rand(counter)).first
        rescue
          @application = nil
        end
        if @application == nil
          @application=Application.first #(:offset => rand(Application.count)) 
        end
      end
      
      if Lecture.first != nil            
        begin
          @lecture=Lecture.where("element_image_file_size != ?", "").limit(counter2).offset(rand(counter)).first
        rescue
          @lecture = nil
        end
        if @lecture == nil
          @lecture=Lecture.first #(:offset => rand(Lecture.count)) 
        end
      end
      
    end
    end
   
     
  end
  
end
